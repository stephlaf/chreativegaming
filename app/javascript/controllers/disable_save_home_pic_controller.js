import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['picInput', 'saveButton']

  connect() {
    console.log(this.picInputTarget);
    console.log(this.saveButtonTarget);
  }
}
