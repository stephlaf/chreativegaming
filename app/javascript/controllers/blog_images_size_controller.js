import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["images"]

  connect() {
    this.imagesTargets.forEach(image => {
      console.log(width, image.width);
      console.log(height, image.height);
      if (image.width > image.height) {
        image.classList.add('landscape')
      } else if (image.height > image.width)  {
        image.classList.add('portrait')
      }
    })
  }
}
