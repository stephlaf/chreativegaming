import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["images"]

  connect() {
    this.imagesTargets.forEach(image => {
      if (image.width > image.height) {
        image.classList.add('landscape')
      } else {
        image.classList.add('portrait')
      }
    })
  }
}
