import { Component } from "../Component";

interface InputControlOptions {
    label: string;
    checked?: boolean;
}

abstract class InputControl extends Component {
    protected label: string;
    protected inputElement: HTMLInputElement;

    constructor(id: string, options: InputControlOptions) {
        super(id);
        this.label = options.label;

        // The main element is a container (e.g., a div)
        this.element.classList.add('input-control');

        // Create the input element
        this.inputElement = document.createElement('input');
        this.inputElement.id = `${id}-input`;
        this.inputElement.checked = options.checked || false;

        // Create the label element
        const labelElement = document.createElement('label');
        labelElement.textContent = this.label;
        labelElement.htmlFor = this.inputElement.id;

        // Append input and label to the container
        this.element.appendChild(this.inputElement);
        this.element.appendChild(labelElement);
    }

    protected createHTMLElement(): HTMLElement {
        return document.createElement('div');
    }

    public isChecked(): boolean {
        return this.inputElement.checked;
    }

    public render(parentElement: HTMLElement): void {
        parentElement.appendChild(this.element);
    }
}

export class Checkbox extends InputControl {
    constructor(id: string, options: InputControlOptions) {
        super(id, options);
        this.inputElement.type = 'checkbox';
        this.element.classList.add('checkbox');
    }
}

export class RadioButton extends InputControl {
    constructor(id: string, options: InputControlOptions) {
        super(id, options);
        this.inputElement.type = 'radio';
        this.element.classList.add('radio-button');
    }

    public setGroup(name: string) {
        this.inputElement.name = name;
    }
}
