import { Desktop } from "./Desktop";
import { Window } from "./components/Window";
import { Button } from "./components/Button";
import { Label } from "./components/Label";
import { TextInput } from "./components/TextInput";
import { Checkbox, RadioButton } from "./components/InputControls";
import { Component } from "./Component";

type ComponentConstructor = new (id: string, options: any) => Component;
const availableComponents: Record<string, { constructor: ComponentConstructor, defaultOptions: any, typeName: string }> = {
    Window: { constructor: Window, defaultOptions: { title: 'New Window', width: 300, height: 150, x: 0, y: 0 }, typeName: 'create_window' },
    Button: { constructor: Button, defaultOptions: { label: 'Button' }, typeName: 'create_button' },
    Label: { constructor: Label, defaultOptions: { text: 'Label' }, typeName: 'create_label' },
    TextInput: { constructor: TextInput, defaultOptions: { value: '' }, typeName: 'create_text_input' },
    Checkbox: { constructor: Checkbox, defaultOptions: { label: 'Checkbox', checked: false }, typeName: 'create_checkbox' },
    RadioButton: { constructor: RadioButton, defaultOptions: { label: 'Radio', checked: false }, typeName: 'create_radio_button' }
};

let selectedComponent: Component | null = null;
const allComponents: Component[] = [];

function selectComponent(component: Component) {
    if (selectedComponent) {
        selectedComponent.getElement().classList.remove('selected');
    }
    selectedComponent = component;
    selectedComponent.getElement().classList.add('selected');
    populatePropertyInspector(selectedComponent);
}

function populatePropertyInspector(component: Component) {
    const propFields = document.getElementById('prop-fields');
    if (!propFields) return;
    propFields.innerHTML = '';
    const idRow = document.createElement('div');
    idRow.innerHTML = `<label>ID</label><input value="${component.getID()}" readonly>`;
    propFields.appendChild(idRow);
}

function generateJson() {
    const commands = allComponents.map(comp => {
        const compType = Object.values(availableComponents).find(c => comp instanceof c.constructor);
        if (!compType) return null;

        const el = comp.getElement();
        const payload: any = {};
        if (comp instanceof Window) {
            payload.title = el.querySelector('.title-bar')?.textContent || 'Window';
            payload.width = parseInt(el.style.width);
            payload.height = parseInt(el.style.height);
            payload.x = parseInt(el.style.left);
            payload.y = parseInt(el.style.top);
        }

        return { command: compType.typeName, id: comp.getID(), payload };
    }).filter(cmd => cmd !== null);

    const jsonOutput = document.getElementById('json-output') as HTMLTextAreaElement;
    jsonOutput.value = JSON.stringify(commands, null, 2);
}

window.addEventListener('DOMContentLoaded', () => {
    const desktop = new Desktop('desktop');
    const palette = document.getElementById('component-palette');
    const canvas = document.getElementById('desktop');
    const exportButton = document.getElementById('export-button');

    if (!palette || !canvas || !exportButton) return;

    // --- Populate Palette (CORRECTED) ---
    for (const compName in availableComponents) {
        const el = document.createElement('div');
        el.className = 'palette-item';
        el.textContent = compName;
        el.draggable = true;
        el.addEventListener('dragstart', (e) => e.dataTransfer?.setData('text/plain', compName));
        palette.appendChild(el);
    }

    // --- Canvas Drag & Drop ---
    canvas.addEventListener('dragover', (e) => e.preventDefault());
    canvas.addEventListener('drop', (e) => {
        e.preventDefault();
        const compName = e.dataTransfer?.getData('text/plain');
        if (!compName || !availableComponents[compName]) return;

        const id = `${compName.toLowerCase()}_${Date.now()}`;
        const compInfo = availableComponents[compName];
        const newComponent = new compInfo.constructor(id, { ...compInfo.defaultOptions });

        desktop.registerComponent(newComponent);
        allComponents.push(newComponent);

        newComponent.getElement().addEventListener('click', (ev) => {
            ev.stopPropagation();
            selectComponent(newComponent);
        });

        newComponent.render(canvas);
        selectComponent(newComponent);
    });

    exportButton.addEventListener('click', generateJson);
});
