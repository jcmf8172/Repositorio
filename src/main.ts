import { Desktop } from "./Desktop";
import { Communicator } from "./Communicator";

// Wait for the DOM to be fully loaded before starting the application
window.addEventListener('DOMContentLoaded', () => {
    // Initialize the main desktop container
    const desktop = new Desktop('desktop');

    // Initialize the communicator
    const communicator = new Communicator(desktop);

    // For now, we will not connect to a real WebSocket server.
    // Instead, we will simulate receiving messages to test the UI.
    console.log("Simulating backend commands...");
    simulateBackend(communicator);
});

/**
 * This function simulates a FreeBasic backend sending commands to the frontend
 * to build a demonstration UI.
 * @param comm The Communicator instance to send commands to.
 */
function simulateBackend(comm: any) { // Using 'any' to access private method for simulation
    const commands = [
        // 1. Create a main window
        {
            command: 'create_window',
            id: 'main_window',
            payload: {
                title: 'My First Window',
                x: 50,
                y: 30,
                width: 400,
                height: 200
            }
        },
        // 2. Add a label to the window
        {
            command: 'create_label',
            id: 'info_label',
            payload: {
                text: 'Enter your name:',
                parentId: 'main_window'
            }
        },
        // 3. Add a text input field
        {
            command: 'create_text_input',
            id: 'name_input',
            payload: {
                value: 'Jules',
                parentId: 'main_window'
            }
        },
        // 4. Add a button
        {
            command: 'create_button',
            id: 'ok_button',
            payload: {
                label: 'Submit',
                parentId: 'main_window'
            }
        }
    ];

    // Process commands as if they were received from a WebSocket
    commands.forEach(cmd => {
        comm.handleCommand(cmd);
    });
}
