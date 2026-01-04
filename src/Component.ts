export abstract class Component {
    protected element: HTMLElement;

    constructor(protected id: string) {
        this.element = this.createHTMLElement();
        this.element.id = this.id;
        this.element.classList.add('component');
    }

    protected abstract createHTMLElement(): HTMLElement;

    public getID(): string {
        return this.id;
    }

    public getElement(): HTMLElement {
        return this.element;
    }

    public abstract render(parentElement: HTMLElement): void;
}
