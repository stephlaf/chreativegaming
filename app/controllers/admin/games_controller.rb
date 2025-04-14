# require_relative '../games_controller'

module Admin
  class GamesController < Admin::ApplicationController
    helper_method :selected_available_platforms

    def create
      @game = resource_class.new(resource_params)
      sanitize_available_platforms

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
      begin
        @game = requested_resource
        JSON.parse(@game.available_platforms)
      rescue ActiveRecord::RecordNotFound
        p "rescued from ActiveRecord::RecordNotFound"
      end
    end

    private

    def sanitize_available_platforms
      available_platforms = JSON.parse(@game.available_platforms)
      @game.available_platforms = available_platforms.reject! { |platform| platform.empty? }
    end
  end
end
