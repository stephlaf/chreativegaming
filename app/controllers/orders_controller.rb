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
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    @order.checkout_session_id = session.id

    begin
      authorize @order
      @order.save
      redirect_to new_order_payment_path(@order)
    rescue Pundit::NotAuthorizedError
      game_already_ordered
    end
  end

  def game_already_ordered
    flash[:alert] = "You have already ordered this game."
    redirect_to games_path
  end
end
