import { Controller } from "@hotwired/stimulus";
import { fabric } from "fabric";

// Connects to data-controller="whiteboard"
export default class extends Controller {
  static targets = ["canvas"];

  canvasTargetConnected() {
    console.log(this.canvasTarget);
    this.canvas = new fabric.Canvas(this.canvasTarget);
    console.log(this.canvas);
    var rect = new fabric.Rect({
      left: 100,
      top: 100,
      fill: 'red',
      width: 20,
      height: 20,
      angle: 45
    });
    this.canvas.add(rect);
    this.canvas.width = 100;
    this.canvas.height = 100;

    rect.set({ left: 20, top: 50 });
    this.canvas.renderAll();
    this.canvas.freeDrawingBrush.color = "#000";
    this.canvas.freeDrawingBrush.width = 10;
    this.canvas.freeDrawingMode = true;

    console.log(JSON.stringify(this.canvas));
  }

  connect() {
  }
}
