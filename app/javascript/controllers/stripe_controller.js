import { Controller } from '@hotwired/stimulus'
// import { Stripe } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    publishableKey: String,
    orderId: String
  }
  connect() {
    // console.log();
  }

  sendRequest() {
    // console.log('From sendRequest');
    const stripe = Stripe(this.publishableKeyValue);
    stripe.redirectToCheckout({
      sessionId: this.orderIdValue
    })//.then(data => console.log(data))
  }

}

// <script src="https://js.stripe.com/v3/"></script>
// <script>
//   const paymentButton = document.getElementById('pay');
//   paymentButton.addEventListener('click', () => {
//     const stripe = Stripe('<%= ENV['STRIPE_PUBLISHABLE_KEY'] %>');
//     stripe.redirectToCheckout({
//       sessionId: '<%= @order.checkout_session_id %>'
//     });
//   });
// </script>
