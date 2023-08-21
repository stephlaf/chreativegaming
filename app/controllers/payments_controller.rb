class PaymentsController < ApplicationController
  before_action :set_order_and_session, only:[ :new, :validate ]

  def new
  end

  def validate
    case @session.payment_status
    when "paid"
      @order.update(state: 'paid')
      redirect_to game_path(@order.game), notice: 'The game is yours!'
    when "unpaid"
      @order.update(state: 'failed')
      redirect_to game_path(@order.game), alert: 'The payment failed'
    else
      p "@session.payment_status is: #{@session.payment_status}"
    end
  end

  private

  def set_order_and_session
    @order = current_user.orders.find(params[:order_id])
    @session  = Stripe::Checkout::Session.retrieve(@order.checkout_session_id)
    authorize @order, policy_class: PaymentPolicy
  end
end
