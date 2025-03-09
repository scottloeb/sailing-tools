// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    console.log('Dashboard loaded');
    
    // Get the visualization form
    const visualizationForm = document.getElementById('visualizationForm');
    
    // Add submit event listener to the form
    if (visualizationForm) {
        visualizationForm.addEventListener('submit', function(event) {
            // Prevent the default form submission
            event.preventDefault();
            
            // Get selected node labels
            const selectedLabels = [];
            const checkboxes = document.querySelectorAll('input[name="node_label"]:checked');
            checkboxes.forEach(checkbox => {
                selectedLabels.push(checkbox.value);
            });
            
            // TODO: Generate visualization based on selected labels
            console.log('Visualize nodes with labels:', selectedLabels);
            
            // Placeholder: update the visualization container
            const container = document.getElementById('visualization-container');
            if (container) {
                container.innerHTML = '<p>Visualization of ' + selectedLabels.join(', ') + ' would appear here</p>';
            }
        });
    }
});
