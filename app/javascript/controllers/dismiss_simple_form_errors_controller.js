import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ ]

  connect() {
    setTimeout(() => {
      this.element.remove()
    }, 2000);
  }
}
