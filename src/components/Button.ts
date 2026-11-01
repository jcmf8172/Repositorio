import { Component } from "../Component";

interface ButtonOptions {
    label: string;
    onClick?: () => void;
}

export class Button extends Component {
    private label: string;

    constructor(id: string, options: ButtonOptions) {
        super(id);
        this.label = options.label;
        this.element.textContent = this.label;
        this.element.classList.add('button');

        if (options.onClick) {
            this.element.addEventListener('click', options.onClick);
        }
    }

    protected createHTMLElement(): HTMLElement {
        return document.createElement('button');
    }

    public render(parentElement: HTMLElement): void {
        parentElement.appendChild(this.element);
    }
}
