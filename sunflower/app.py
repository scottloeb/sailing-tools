"""
Sunflower - Graph Database Visualization and Exploration
Part of the G.A.R.D.E.N. ecosystem

This application provides an interactive interface for visualizing
and exploring Neo4j graph databases that have been processed by
the Grasshopper Module Generator.
"""

import os
import sys
from flask import Flask, render_template, request, jsonify, redirect, url_for, session

# Add the module-generators/neo4j directory to the path
parent_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
module_dir = os.path.join(parent_dir, 'module-generators', 'neo4j')
sys.path.append(module_dir)

# Add PWD environment variable for Windows compatibility
if 'PWD' not in os.environ:
    os.environ['PWD'] = os.getcwd()

# Make utils directory accessible
utils_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'utils')
sys.path.append(utils_dir)

# Try to import the database manager
try:
    from db_manager import db_manager
    print("Successfully imported Database Manager")
except ImportError as e:
    print(f"Warning: Could not import Database Manager: {e}")
    print("Make sure you've created the db_manager.py file in the utils directory")
    sys.exit(1)

# Try to import the modulegenerator
try:
    # First make sure neo4j is installed
    import neo4j
    # Then import the generator
    from modulegenerator import generate_module
    print("Successfully imported Module Generator")
    module_generator_available = True
except ImportError as e:
    print(f"Warning: Could not import Module Generator: {e}")
    print("Please make sure the 'neo4j' package is installed using 'pip install neo4j'")
    module_generator_available = False

# Initialize Flask application
app = Flask(__name__, 
            static_folder='static',
            template_folder='templates')

# Set a secret key for session management
app.secret_key = 'sunflower-secret-key'  # In production, use a proper secret key

# Home page route
@app.route('/')
def home():
    """Render the home page"""
    return render_template('index.html', title="Sunflower - Graph Explorer")

# Database connection settings route
@app.route('/connect', methods=['GET', 'POST'])
def connect():
    """Handle database connection"""
    if request.method == 'POST':
        # Get connection details from form
        uri = request.form.get('uri', 'bolt://localhost:7687')
        username = request.form.get('username', 'neo4j')
        password = request.form.get('password', 'neo4j')
        name = request.form.get('name', f"Connection {len(db_manager.connections) + 1}")
        
        if not module_generator_available:
            return jsonify({
                'success': False, 
                'message': 'Module Generator not available. Please install neo4j package with "pip install neo4j"'
            })
        
        # Try to connect to the database
        result = db_manager.connect(
            uri=uri,
            username=username,
            password=password,
            name=name,
            module_generator=generate_module
        )
        
        if result['success']:
            # Store the current connection in the session
            session['current_connection'] = name
            
            # Redirect to the dashboard if it's an HTML request
            if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
                return jsonify(result)
            else:
                return redirect(url_for('dashboard'))
        else:
            return jsonify(result)
    
    # If GET request, show the connection form
    return render_template('connect.html', title="Connect to Database")

# Dashboard route
@app.route('/dashboard')
def dashboard():
    """Display the database dashboard"""
    current_connection = session.get('current_connection')
    
    if not current_connection:
        # No connection, redirect to connect page
        return redirect(url_for('connect'))
    
    # Get database info
    db_info = db_manager.get_database_info(current_connection)
    
    if not db_info:
        # Failed to get info, redirect to connect page
        return redirect(url_for('connect'))
    
    # Render the dashboard
    return render_template(
        'dashboard.html',
        title="Sunflower - Dashboard",
        connection=current_connection,
        db_info=db_info
    )

# API to get database info
@app.route('/api/database_info')
def api_database_info():
    """Get information about the connected database"""
    current_connection = session.get('current_connection')
    
    if not current_connection:
        return jsonify({'success': False, 'message': 'No active connection'})
    
    db_info = db_manager.get_database_info(current_connection)
    
    if not db_info:
        return jsonify({'success': False, 'message': 'Failed to get database info'})
    
    return jsonify({'success': True, 'data': db_info})

if __name__ == '__main__':
    # Start the development server
    app.run(debug=True, port=5000)