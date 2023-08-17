import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dismissable"
export default class extends Controller {
  connect() {
    console.log(`connected: ${this.element}`);
  }

  dismiss() {
    console.log(this.element);
    this.element.remove();
  }
}
