import { Component } from "./Component";

export class Desktop {
    private element: HTMLElement;
    private componentRegistry: Map<string, Component> = new Map();

    constructor(elementId: string) {
        const desktopElement = document.getElementById(elementId);
        if (!desktopElement) {
            throw new Error(`Desktop element with id #${elementId} not found.`);
        }
        this.element = desktopElement;
    }

    public registerComponent(component: Component): void {
        if (this.componentRegistry.has(component.getID())) {
            console.warn(`Component with id ${component.getID()} already exists in the registry.`);
            return;
        }
        this.componentRegistry.set(component.getID(), component);
    }

    public unregisterComponent(componentId: string): void {
        this.componentRegistry.delete(componentId);
    }

    public getComponentById(componentId: string): Component | undefined {
        return this.componentRegistry.get(componentId);
    }

    public getRootElement(): HTMLElement {
        return this.element;
    }
}
