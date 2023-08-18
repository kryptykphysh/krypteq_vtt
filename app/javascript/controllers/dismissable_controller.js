import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dismissable"
export default class extends Controller {
  connect() {
    setTimeout(() => this.dismiss(), 10000);
  }

  dismiss() {
    console.log("dismiss called");
    this.element.classList.add("animate__fadeOutUp");
    this.element.addEventListener("animationend", () => {
      this.element.remove();
    });
  }
}
