import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    publishableKey: String
    // orderId: String
  }

  static targets = [ 'form' ]

  connect() {
    console.log(this.formTarget.action);
    // console.log(this.publishableKeyValue);
  }

  createOrder(event) {
    event.preventDefault()
    event.stopImmediatePropagation()
    console.log('From createOrder');

    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'text/plain'},
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
      })
  }

  // sendRequest() {
  //   const stripe = Stripe(this.publishableKeyValue);
  //   stripe.redirectToCheckout({
  //     sessionId: this.orderIdValue
  //   })
  // }
}
