import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dismissable"
export default class extends Controller {
  dismiss() {
    this.element.classList.add("animate__fadeOutUp");
    this.element.addEventListener("animationend", () => {
      this.element.remove();
    });
  }
}
