import { html, render } from "/node_modules/lit-html/lit-html.js";

const style = html`
  <style>
    :host {
      display: flex;
      width: 100%;
      height: 100%;
      background: green;
      flex-wrap: wrap;
    }

    .grid-item {
      width: 10px;
      height: 10px;
      background-color: rgba(255, 255, 255, 0.8);
      border: 1px solid rgba(0, 0, 0, 0.8);
      padding: 20px;
      font-size: 30px;
      text-align: center;
      overflow: hidden;
    }

    .grid-item[cola] {
      background: black;
      border: 1px solid white;
    }
    .grid-item[cabeza] {
      background: blue;
    }
  </style>
`;

export class SnakeTablero extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: "open" });
    this.items = Array.from(Array(300).keys());
    this.posicion = 0;
    this.cola = 0;
    this.tam = 1;
  }

  connectedCallback() {
    this.render();
    this.shadowRoot.addEventListener("click", this.mover);
    this.shadowRoot.addEventListener("keydown", this.mover);
  }

  mover(e) {
    console.log(e);
  }
  actualizaTablero() {
    this.posicion++;
    this.cola = this.posicion - this.tam;
    this.render();
  }

  template() {
    return html`
      ${style}
      ${this.items.map((i) => {
        if (i == this.posicion) {
          return html` <div class="grid-item" key=${i} cabeza></div> `;
        } else if (i <= this.posicion && i >= this.cola) {
          return html` <div class="grid-item" key=${i} cola></div> `;
        } else {
          return html` <div class="grid-item" key=${i}></div> `;
        }
      })}
    `;
  }
  render() {
    render(this.template(), this.shadowRoot, { eventContext: this });
  }
}

customElements.define("snake-tablero", SnakeTablero);
