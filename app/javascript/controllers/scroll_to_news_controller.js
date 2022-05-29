import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ ]

  connect() {
  }

  scroll() {
    const newsfeed = document.getElementById('the-good-place')
    newsfeed.scrollIntoView({
        behavior: 'smooth'
    })
  }
}
