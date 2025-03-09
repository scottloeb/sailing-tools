// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Get the connection form and status div
    const connectionForm = document.getElementById('connectionForm');
    const connectionStatus = document.getElementById('connectionStatus');

    // Add submit event listener to the form
    connectionForm.addEventListener('submit', function(event) {
        // Prevent the default form submission
        event.preventDefault();
        
        // Show a loading message
        connectionStatus.className = '';
        connectionStatus.textContent = 'Connecting to database...';
        
        // Get form data
        const formData = new FormData(connectionForm);
        
        // Send the data using fetch API
        fetch('/connect', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Connection successful
                connectionStatus.className = 'success';
                connectionStatus.textContent = 'Connection successful!';
                
                // Redirect after a short delay
                setTimeout(() => {
                    window.location.href = '/';
                }, 2000);
            } else {
                // Connection failed
                connectionStatus.className = 'error';
                connectionStatus.textContent = 'Connection failed: ' + data.message;
            }
        })
        .catch(error => {
            // Error in the request
            connectionStatus.className = 'error';
            connectionStatus.textContent = 'Error: ' + error.message;
        });
    });
});
