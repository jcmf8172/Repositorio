import { Desktop } from "./Desktop";
import { Window } from "./components/Window";
import { Button } from "./components/Button";
import { Label } from "./components/Label";
import { TextInput } from "./components/TextInput";
import { Checkbox, RadioButton } from "./components/InputControls";

// Define the structure of commands received from the backend
interface BackendCommand {
    command: string;
    id: string;
    payload: any;
}

export class Communicator {
    private socket: WebSocket | null = null;
    private desktop: Desktop;
    private commandHandlers: Map<string, (payload: any, id: string) => void> = new Map();

    constructor(desktop: Desktop) {
        this.desktop = desktop;
        this.registerDefaultHandlers();
    }

    public connect(url: string): void {
        this.socket = new WebSocket(url);

        this.socket.onopen = () => {
            console.log("WebSocket connection established.");
        };

        this.socket.onmessage = (event) => {
            try {
                const data = JSON.parse(event.data) as BackendCommand;
                this.handleCommand(data);
            } catch (error) {
                console.error("Error parsing incoming message:", error);
            }
        };

        this.socket.onclose = () => {
            console.log("WebSocket connection closed.");
        };

        this.socket.onerror = (error) => {
            console.error("WebSocket error:", error);
        };
    }

    public sendMessage(event: string, id: string, payload: any): void {
        if (this.socket && this.socket.readyState === WebSocket.OPEN) {
            const message = JSON.stringify({ event, id, payload });
            this.socket.send(message);
        } else {
            console.warn("WebSocket is not connected. Message not sent.");
        }
    }

    public handleCommand(command: BackendCommand): void {
        const handler = this.commandHandlers.get(command.command);
        if (handler) {
            handler(command.payload, command.id);
        } else {
            console.warn(`No handler registered for command: ${command.command}`);
        }
    }

    private registerDefaultHandlers(): void {
        this.commandHandlers.set("create_window", (payload, id) => {
            const window = new Window(id, payload);
            this.desktop.registerComponent(window);
            window.render(this.desktop.getRootElement());
        });

        this.commandHandlers.set("create_button", (payload, id) => {
            const parent = this.desktop.getComponentById(payload.parentId);
            if (!parent) return;

            const button = new Button(id, {
                label: payload.label,
                onClick: () => this.sendMessage("click", id, {}),
            });
            this.desktop.registerComponent(button);

            const contentArea = parent.getElement().querySelector('.content') || parent.getElement();
            button.render(contentArea);
        });

        this.commandHandlers.set("create_label", (payload, id) => {
            const parent = this.desktop.getComponentById(payload.parentId);
            if (!parent) return;

            const label = new Label(id, payload);
            this.desktop.registerComponent(label);

            const contentArea = parent.getElement().querySelector('.content') || parent.getElement();
            label.render(contentArea);
        });

        this.commandHandlers.set("create_text_input", (payload, id) => {
            const parent = this.desktop.getComponentById(payload.parentId);
            if (!parent) return;

            const textInput = new TextInput(id, payload);
            this.desktop.registerComponent(textInput);

            const contentArea = parent.getElement().querySelector('.content') || parent.getElement();
            textInput.render(contentArea);
        });

        this.commandHandlers.set("create_checkbox", (payload, id) => {
            const parent = this.desktop.getComponentById(payload.parentId);
            if (!parent) return;

            const checkbox = new Checkbox(id, payload);
            this.desktop.registerComponent(checkbox);

            const contentArea = parent.getElement().querySelector('.content') || parent.getElement();
            checkbox.render(contentArea);
        });

        this.commandHandlers.set("create_radio_button", (payload, id) => {
            const parent = this.desktop.getComponentById(payload.parentId);
            if (!parent) return;

            const radioButton = new RadioButton(id, payload);
            this.desktop.registerComponent(radioButton);

            if (payload.group) {
                radioButton.setGroup(payload.group);
            }
            const contentArea = parent.getElement().querySelector('.content') || parent.getElement();
            radioButton.render(contentArea);
        });
    }
}
