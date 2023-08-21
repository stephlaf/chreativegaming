import { Controller } from '@hotwired/stimulus'
import imagesLoaded from 'imagesloaded'

export default class extends Controller {
  static targets = ["images"]

  connect() {
    imagesLoaded( this.element, () => {
      this.imagesTargets.forEach(image => {
        if (image.width > image.height) {
          image.classList.add('landscape')
          image.classList.remove('d-none')
        } else if (image.height > image.width)  {
          image.classList.add('portrait')
          image.classList.remove('d-none')
        }
      })
    });
  }
}
