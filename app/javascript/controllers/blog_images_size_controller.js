import { Controller } from '@hotwired/stimulus'
import imagesLoaded from 'imagesloaded'

export default class extends Controller {
  static targets = ["images"]

  connect() {
    imagesLoaded( this.element, () => {
      this.imagesTargets.forEach(image => {
        if (image.width > image.height) {
          image.classList.add('landscape')
        } else if (image.height > image.width)  {
          image.classList.add('portrait')
        } else {
          image.classList.add('square')
        }
        image.classList.remove('d-none')
      })
    });
  }
}
