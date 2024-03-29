class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: []

  before_action :set_game, only: [:show, :destroy]
  before_action :set_user, except: [:index]

  def index
    @games = policy_scope(Game).order(created_at: :desc)
    set_level
  end

  def show
    set_level
    @price = get_prices[@level.gsub(' ', '_').downcase.to_sym]
    @prices = get_prices
  end

  def my_games
    @games = current_user.bought_games
    @game = Game.new
    authorize @game
  end

  def destroy
    authorize @game
    @game.destroy
    redirect_to games_path
  end

  private

  def set_game
    # raise
    if params[:id].to_i.zero?
      redirect_to games_path and return
    else
      @game = Game.find(params[:id])
      authorize @game
    end
  end

  def set_user
    @current_user = current_user
  end

  def game_params
    params.require(:game).permit(:name,
      :description,
      :category,
      :price_cents,
      :thumbnail,
      :banner,
      :game_file
    )
  end

  def set_prices
    @game.price_bronze_cents = @game.price_cents * 0.9
    @game.price_silver_cents = @game.price_cents * 0.8
    @game.price_gold_cents = @game.price_cents * 0.7
    @game.price_platinum_cents = @game.price_cents * 0.5
  end

  def get_prices
    case @level
    when 'Bronze'
      { bronze: @game.price_bronze,
        silver: @game.price_silver,
        gold: @game.price_gold,
        platinum: @game.price_platinum }
    when 'Silver'
      { silver: @game.price_silver,
        gold: @game.price_gold,
        platinum: @game.price_platinum }
    when 'Gold'
      { gold: @game.price_gold, platinum: @game.price_platinum }
    when 'Platinum'
      { platinum: @game.price_platinum }
    else
      { non_member: @game.price,
        bronze: @game.price_bronze,
        silver: @game.price_silver,
        gold: @game.price_gold,
        platinum: @game.price_platinum }
    end
  end

  def set_level
    if @current_user
      @level = @current_user.membership_level
    else
      @level = 'Non member'
    end
  end
end
