import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    publishableKey: String,
    orderId: String
  }
  connect() {
  }

  sendRequest() {
    const stripe = Stripe(this.publishableKeyValue);
    stripe.redirectToCheckout({
      sessionId: this.orderIdValue
    })
  }
}
