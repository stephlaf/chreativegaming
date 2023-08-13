import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    publishableKey: String
  }

  static targets = [ 'form', 'submitButton' ]

  connect() {
  }

  createOrder(event) {
    event.preventDefault()
    event.stopImmediatePropagation()
    this.submitButtonTarget.disabled = true

    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'text/plain'},
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((checkoutSessionId) => {
      this.sendRequest(checkoutSessionId);
    })
  }

  sendRequest(checkoutSessionId) {
    this.submitButtonTarget.disabled = false
    const stripe = Stripe(this.publishableKeyValue);
    stripe.redirectToCheckout({
      sessionId: checkoutSessionId
    })
  }
}
