# require_relative '../games_controller'

module Admin
  class GamesController < Admin::ApplicationController
    def create
      @game = resource_class.new(resource_params)
      # authorize_resource(@game)
      # set_prices

      if @game.save
        redirect_to(
          [namespace, @game],
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, @game),
        }
      end
    end

    def update
      if requested_resource.update(resource_params)
        # @game = requested_resource
        # set_prices
        # @game.save
        redirect_to(
          [namespace, requested_resource],
          notice: translate_with_resource("update.success"),
        )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end

    private

    # def set_prices
    #   @game.price_bronze_cents = @game.price_cents * 0.9
    #   @game.price_silver_cents = @game.price_cents * 0.8
    #   @game.price_gold_cents = @game.price_cents * 0.7
    #   @game.price_platinum_cents = @game.price_cents * 0.5
    # end
  end
end
