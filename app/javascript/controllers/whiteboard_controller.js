import { Controller } from "@hotwired/stimulus";
import { fabric } from "fabric";

// Connects to data-controller="whiteboard"
export default class extends Controller {
  static targets = ["canvas"];

  canvasTargetConnected() {
    this.canvas = new fabric.Canvas(
      this.canvasTarget,
      {
        width: this.element.clientWidth,
        height: window.innerHeight,
      }
    );

    this.canvas.on({
      'mouse:down': this.mouseDownHandler,
      'mouse:move': this.mouseMoveHandler,
      'mouse:out': this.mouseOutHandler,
      'mouse:over': this.mouseOverHandler,
      'mouse:up': this.mouseUpHandler,
      'object:added': this.objectAddedHandler,
    });

    var rect = new fabric.Rect({
      left: 100,
      top: 100,
      fill: 'red',
      width: 20,
      height: 20,
      angle: 45
    });
    this.canvas.add(rect);
    // this.canvas.setHeight = this.element.clientHeight;
    // this.canvas.setHeight = (window.innerHeight * 0.9);

    rect.set({ left: 20, top: 50 });
    this.canvas.freeDrawingBrush.color = "#000";
    this.canvas.freeDrawingBrush.width = 10;
    this.canvas.isDrawingMode = true;
    this.canvas.renderAll();


    console.log(JSON.stringify(this.canvas));
  }

  connect() {
  }

  mouseDownHandler(evt) {
    console.log(evt);
    console.log("Mouse click");
  }

  mouseMoveHandler(evt) {
    console.log(evt);
    console.log("Mouse move");
  }

  mouseUpHandler(evt) {
    console.log(evt);
    console.log("Mouse release");
  }

  objectAddedHandler(evt) {
    console.log(evt);
    console.log("object added");
  }
}
