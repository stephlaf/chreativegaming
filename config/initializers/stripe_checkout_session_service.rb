class StripeCheckoutSessionService
  def call(event)
    # order = Order.find_by(checkout_session_id: event.data.object.id)
    # # p JSON.parse(event.data)
    # p event
    # p ""
    # p event.data
    # p ""
    # p "EVENT TYPE IS:  #{event.type}"
    # p ""
    # # order.update(state: 'paid')

  end
end
