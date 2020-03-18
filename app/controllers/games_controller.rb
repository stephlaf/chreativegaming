class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_game, only: [:show, :edit, :update, :destroy, :toggle_availability]
  before_action :set_user, except: [:index]

  def index
    @games = policy_scope(Game)
  end

  def show
    if @current_user
      @level = @current_user.membership_level
    else
      @level = 'Bronze'
    end
    @price = get_prices[@level.downcase.to_sym]
    @prices = get_prices
  end

  def new
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    authorize @game

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    authorize @game
  end

  def update
    # raise
    authorize @game
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
    authorize @game
    @game.destroy
    redirect_to games_path
  end

  def toggle_availability
    @game.toggle!(:available)
    redirect_to game_path(@game)
  end

  private

  def set_game
    @game = Game.find(params[:id])
    authorize @game
  end

  def set_user
    @current_user = current_user
  end

  def game_params
    params.require(:game).permit(:name,
      :description,
      :category,
      :price_cents,
      :price_bronze_cents,
      :price_silver_cents,
      :price_gold_cents,
      :price_platinum_cents,
      :thumbnail,
      :banner,
      :game_file
    )
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
    end
  end
end

