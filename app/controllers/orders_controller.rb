class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

  def create
    @game = Game.find(params[:game_id])
    @order = Order.create(
                game: @game,
                amount: @game.price_cents,
                state: 'pending',
                user: current_user
              )

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        quantity: 1,
        price_data: {
          unit_amount: @game.price_cents,
          currency: 'CAD',
          product_data: {
            name: @game.name
          }
        }
        }],
      mode: 'payment',
      success_url: order_validate_transaction_url(@order),
      cancel_url: "#{rollback_canceled_order_url}?order_id=#{(@order.id)}"
    )

    @order.checkout_session_id = session.id

    begin
      authorize @order
      @order.save
      respond_to do |format|
        format.html { redirect_to new_order_payment_path(@order) }
        format.text { render partial: 'checkout_session_id', locals: { order: @order }, formats: :html }
      end
    rescue Pundit::NotAuthorizedError
      game_already_ordered
    end
  end

  def rollback_canceled_order
    @order = Order.find(params[:order_id])
    authorize @order
    @order.destroy
    redirect_to game_path(@order.game), alert: 'The transaction was canceled'
  end

  private

  def game_already_ordered
    redirect_to games_path, alert: "You have already ordered this game."
  end
end
