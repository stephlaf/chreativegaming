class PaymentsController < ApplicationController
  before_action :set_order, only:[ :new, :validate ]

  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @session  = Stripe::Checkout::Session.retrieve(@order.checkout_session_id)
    authorize @order, policy_class: PaymentPolicy
  end

  def validate
    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    case session.payment_status
    when "paid"
      @order.update(state: 'paid')
      redirect_to game_path(@order.game), notice: 'The game is yours!'
    when "unpaid"
      redirect_to game_path(@order.game), alert: 'The payment failed'
    end
  end

  private

  def set_order
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    authorize @order, policy_class: PaymentPolicy
  end
end
