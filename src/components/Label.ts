import { Component } from "../Component";

interface LabelOptions {
    text: string;
}

export class Label extends Component {
    private text: string;

    constructor(id: string, options: LabelOptions) {
        super(id);
        this.text = options.text;
        this.element.textContent = this.text;
        this.element.classList.add('label');
    }

    protected createHTMLElement(): HTMLElement {
        return document.createElement('span');
    }

    public render(parentElement: HTMLElement): void {
        parentElement.appendChild(this.element);
    }
}
