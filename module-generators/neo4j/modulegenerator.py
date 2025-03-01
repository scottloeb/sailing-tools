"""
This program is intended to be run as a script, or through the
generate_module function. Functions prefixed with a _ are for
internal processing and are not intended to be used outside of
this module (but feel free to give it a shot).

This program assumes the following dependencies have been installed
in this environment:
    - neo4j

This program accepts the following command-line inputs:
    --uri: a connection string to a neo4j instance
    --name: a name for the generated module
    --username: a username for the account that will access neo4j
    --password: a password for the account that will access neo4j
"""

# Python standard libraries
import os
import logging
import sys
import argparse
import datetime
import inspect

# Pip installs
# https://neo4j.com/docs/api/python-driver/current/
import neo4j
from neo4j import GraphDatabase

VERSION = (0,0,0)

# Add the module generator to our PATH variable
path = f'{sys.path[-1].split(".env")[0]}module-generators/neo4j'
sys.path.append(path)
import modulegenerator

profile = {
    'uri':'bolt://localhost:7687',
    'database':'neo4j',
    'username':'neo4j',
    'password':'neo4j-dev'
}

class Queries:
    def server_timestamp():
        text = 'RETURN datetime() AS timestamp;'
        params = None
        return text, params
    
    def labels():
        text = 'CALL db.labels();'
        params = None
        return text, params
    
    def node_properties(label, limit=None):
        text = f"""
            MATCH 
                (n:{label}) 
            WITH n 
            {f"LIMIT {limit}" if limit is not None else ""}
            UNWIND apoc.meta.cypher.types(n) AS props
            RETURN collect(DISTINCT props) AS props;
        """
        params = None
        return text, params
    
    def relationship_types():
        text = 'CALL db.relationshipTypes();'
        params = None
        return text, params
    
    def edge_properties(type, limit=1000):
        text = f"""
            MATCH
                (a)-[e:{type}]->(b)
            WITH a, e, b
            {f"LIMIT {limit}" if limit is not None else ""}
            UNWIND apoc.meta.cypher.types(e) AS props
            UNWIND labels(a) AS startLabels
            UNWIND labels(b) AS endLabels
            RETURN 
            collect(DISTINCT props) as props,
            collect(DISTINCT startLabels) AS startLabels,
            collect(DISTINCT endLabels) AS endLabels;
        """
        params = None 
        return text, params
    
###############################################################################
# _Internal functions
# These make the public functions work. While they can be called directly,
# they are not designed for that use and may not be as easy to work with as
# the public functions.
###############################################################################

def _append(filename, text):
    """
    Appends text to the end of the specified file with a newline.

    Parameters
    ----------
    filename: str
        The _ in _graph.py

    text: str, list(str)
        Text to write to the module.
        Can be a single string to append or a list of strings.

    Returns
    -------
    None
    """

    with open(filename, 'a+') as outfile:
        outfile.write(f'{text}\n')
        
def _append_imports(filename, imports):
    """
    Appends imports to the beginning of the file.

    Parameters
    ----------
    imports: list(str)
        A list of imports to be written to the top of the file.

    Returns
    -------
    None
    """
    for module in imports:
        _append(filename, f'import {module}')

def _authenticated_driver(uri=profile['uri'], username=profile['username'], password=profile['password']):
    """
    Internal method to set up an authenticated driver.

    Parameters
    ----------
    uri: str
        neo4j connection string
    usernname: str
        username for the neo4j account
    password: str
        password for the neo4j account
    
    Returns
    -------
    neo4j.GraphDatabase.Driver instance to connect to the database.
    """
    return GraphDatabase.driver(uri, auth=(username, password))

def _get_labels():
    """
    Returns a list of labels in use by the database.

    Parameters
    ----------
    None

    Returns
    -------
    list(str):
        A list of Neo4j labels in use by the database.
    """
    text, params = Queries.labels()
    results = _query(text, params)
    return list(map(lambda row: row['label'], results))

def _get_relationship_types():
    """
    Returns a list of relationship types in use by the database.

    Parameters
    ----------
    None

    Returns
    -------
    list(str):
        A list of Neo4j edge types in use by the database.
    """
    text, params = Queries.relationship_types()
    results = _query(text, params)
    return list(map(lambda row: row['relationshipType'], results))

def _get_node_props(label):
    """
    Given a neo4j label, get the properties on that label.
    Is it possible to return these as (name, type)?

    Parameters
    ----------
    label: str
        A neo4j label, without the :

    Returns
    -------
    list(str):
        A list of properties on this node.
    """
    text, params = Queries.node_properties(label)
    results = _query(text, params)
    return results[0]['props']

def _query(query_text=None, query_params=None):
    """
    Submits a parameterized Cypher query to Neo4j.

    Parameters
    ----------
    query_text: str
        A valid Cypher query string.
    query_params: list(str)
        A list of parameters to be passed along with the query_text.

    Returns
    -------
    A tuple of dictionaries, representing entities returned by the query.
    """
    with _authenticated_driver().session() as session:
        return session.run(query_text, query_params).data()
    
def _schema():
    """
    Compiles schema for the graph.

    CURRENT: Nodes and their properties.
    TODO: Edges and their properties
    TODO: Edge types between node labels.
    """
    return dict(map(lambda e: (e, modulegenerator._get_node_props(e)), modulegenerator._get_labels()))

def _server_timestamp():
    """
    Retrieves a timestamp from the neo4j isntance and prints a message 
    to the screen. 

    Parameters
    ----------
    None

    Returns
    -------
    str:
        Timestamp from server.
    """
    text, params = Queries.server_timestamp()

    return _query(query_text=text, query_params=params)[0]['timestamp'].iso_format()

###############################################################################
# Public functions
###############################################################################

def generate_module(uri=None, username=None, password=None, graph=None, output_directory=os.environ['PWD']):
    """
    Assembler function collects strings containing valid Python code
    into a list, then writes the list to a new python module (a file
    ending in .py) in a single write operation.

    Parameters
    ----------
    uri: str
        A connection string for the neo4j instance.
    name: str
        The user name for the neo4j account. This account needs read access.
    pw: str
        The password for the neo4j account.
    graph: str
        The name of the graph for the generated module, e.g. name="demo" 
        results in demograph.py.
    output_directory: str

    Returns
    -------
    str:
        The filepath to the generated module.
    """

    def _log(msg):
        with open('modulegenerator.out', '+a') as log:
            log.write(f'{datetime.datetime.now()}: {msg}\n')


    module_name = f"""{graph if graph is not None else "new"}graph"""
    filename = f"""{module_name}.py"""
    _log(f'Generating module: {filename}')

    if os.path.exists(filename):
        _log(f'Old module found; deleting.')
        os.remove(filename)

    # Boilerplate
    _log('Writing boilerplate to top of file.')
    _append(filename, f'# Date generated: {_server_timestamp()}\n')
    _append(filename, f"# Generated with modulegenerator version {VERSION}")
    _append(filename, f"# Generated with neo4j driver version {neo4j.__version__}")

    _log('Appending imports to module')
    _append_imports(filename, imports=['neo4j'])
    _append(filename, 'from neo4j import GraphDatabase\n')

    # get an authenticated driver
    driver = _authenticated_driver(uri=uri, username=username, password=password)

    # Copy query functions into the generated module.
    _append(filename, "".join(inspect.getsourcelines(modulegenerator.Queries)[0]))
    _append(filename, "".join(inspect.getsourcelines(modulegenerator._authenticated_driver)[0]))
    _append(filename, "".join(inspect.getsourcelines(modulegenerator._query)[0]))
    _append(filename, "".join(inspect.getsourcelines(modulegenerator._server_timestamp)[0]))

    _log(f"{filename} successfully generated.")
    return filename

if __name__ == '__main__':
    print('neo4j/modulegenerator is being run as a script.')
    
    # Configure command-line arguments.
    parser = argparse.ArgumentParser(description='Utility script for generating neo4j backend code.')
    parser.add_argument('-d', '--database', help='the neo4j database to query')
    parser.add_argument('-g', '--graph', help='the <name> in <name>graph.py', action='store')
    parser.add_argument('-n', '--name', help='username for neo4j account',action='store')
    parser.add_argument('-o', '--output', help='directory to write the generated module to', action='store')
    parser.add_argument('-p', '--password', help='password for neo4j account', action='store')
    parser.add_argument('-u', '--uri', help='neo4j connection string', action='store')
    
    args = parser.parse_args()

    # Update the graph object if command-line arguments were passed.
    if args.uri is not None and args.name is not None and args.password is not None:
        profile['uri'] = args.uri
        profile['username'] = args.name
        profile['password'] = args.password
        profile['database'] = args.database

    # Default output is newgraph.py
    graph = args.graph

    # If no output argument is passed, use the 
    output_directory = args.output if args.output is not None else 'generated_modules'
                      
    print(f'Generating: {graph}graph.py',
          f'At: {profile["uri"]}',
          f'For database: {profile["database"]}'
          f'Username: {profile["username"]}',
          f'Password: {"*" * len(profile["password"])}',
          f'Generated module will be written to: {output_directory}/',
          sep='\n')

    # Generating the module with our neo4j-dev hardcoded. This instance contains
    # only sample data.
    generate_module(uri='bolt://localhost:7687', 
                    graph=graph, 
                    output_directory=output_directory)