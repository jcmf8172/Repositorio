import { Component } from "../Component";

interface TextInputOptions {
    value?: string;
}

export class TextInput extends Component {

    constructor(id: string, options: TextInputOptions) {
        super(id);
        (this.element as HTMLInputElement).value = options.value || '';
        this.element.classList.add('text-input');
    }

    protected createHTMLElement(): HTMLElement {
        const input = document.createElement('input');
        input.type = 'text';
        return input;
    }

    public getValue(): string {
        return (this.element as HTMLInputElement).value;
    }

    public render(parentElement: HTMLElement): void {
        parentElement.appendChild(this.element);
    }
}
