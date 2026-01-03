import { Component } from "../Component";

interface WindowOptions {
    title: string;
    width: number;
    height: number;
    x: number;
    y: number;
}

export class Window extends Component {
    private title: string;
    private width: number;
    private height: number;

    constructor(id: string, options: WindowOptions) {
        super(id);
        this.title = options.title;
        this.width = options.width;
        this.height = options.height;
        this.element.style.width = `${this.width}px`;
        this.element.style.height = `${this.height}px`;
        this.element.style.left = `${options.x}px`;
        this.element.style.top = `${options.y}px`;
        this.element.classList.add('window');

        const titleBar = document.createElement('div');
        titleBar.className = 'title-bar';
        titleBar.textContent = this.title;

        const content = document.createElement('div');
        content.className = 'content';

        this.element.appendChild(titleBar);
        this.element.appendChild(content);

        this.makeDraggable(titleBar);
    }

    private makeDraggable(titleBar: HTMLElement): void {
        let isDragging = false;
        let offsetX = 0;
        let offsetY = 0;

        const onMouseDown = (e: MouseEvent) => {
            isDragging = true;
            offsetX = e.clientX - this.element.offsetLeft;
            offsetY = e.clientY - this.element.offsetTop;
            document.addEventListener('mousemove', onMouseMove);
            document.addEventListener('mouseup', onMouseUp);
        };

        const onMouseMove = (e: MouseEvent) => {
            if (!isDragging) return;
            this.element.style.left = `${e.clientX - offsetX}px`;
            this.element.style.top = `${e.clientY - offsetY}px`;
        };

        const onMouseUp = () => {
            isDragging = false;
            document.removeEventListener('mousemove', onMouseMove);
            document.removeEventListener('mouseup', onMouseUp);
        };

        titleBar.addEventListener('mousedown', onMouseDown);
    }

    protected createHTMLElement(): HTMLElement {
        return document.createElement('div');
    }

    public render(parentElement: HTMLElement): void {
        parentElement.appendChild(this.element);
    }
}
