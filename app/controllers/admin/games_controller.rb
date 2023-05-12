# require_relative '../games_controller'

module Admin
  class GamesController < Admin::ApplicationController
    helper_method :selected_available_platforms

    def create
      @game = resource_class.new(resource_params)
      sanitize_available_platforms
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
      previous_game_version = Game.find(params[:id])
      if requested_resource.update(resource_params)
        @game = requested_resource
        if @game.available_platforms == "[\"\"]"
          @game.available_platforms = previous_game_version.available_platforms
        else
          sanitize_available_platforms
        end
        @game.save
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

    def selected_available_platforms
      @game = requested_resource
      JSON.parse(@game.available_platforms)
    end

    private

    def sanitize_available_platforms
      available_platforms = JSON.parse(@game.available_platforms)
      @game.available_platforms = available_platforms.reject! { |platform| platform.empty? }
    end

    # def set_prices
    #   @game.price_bronze_cents = @game.price_cents * 0.9
    #   @game.price_silver_cents = @game.price_cents * 0.8
    #   @game.price_gold_cents = @game.price_cents * 0.7
    #   @game.price_platinum_cents = @game.price_cents * 0.5
    # end
  end
end
