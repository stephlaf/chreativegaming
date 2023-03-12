import { Controller } from '@hotwired/stimulus'
import { Popover } from "bootstrap/dist/js/bootstrap.bundle.js";


export default class extends Controller {
  static targets = [ ]

  connect() {
    console.log("hey from popover controller");
    new Popover(this.element, {
      content: "Lorem ipsum dolor sit amet consectetur adipisicing elit.",
      trigger: 'focus'
    })
  }

}
