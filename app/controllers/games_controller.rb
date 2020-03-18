class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_game, only: [:show, :edit, :update, :destroy, :toggle_availability]
  before_action :set_user, except: [:index]

  def index
    @games = policy_scope(Game)
  end

  def show
    @level = @current_user.membership_level
    @price = get_prices.first
    @prices = get_prices[1..]
    # raise
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
    prices = [
      @game.price_bronze_cents,
      @game.price_silver_cents,
      @game.price_gold_cents,
      @game.price_platinum_cents
    ]
    case @level
      when 'Bronze' then prices[0..3]
      when 'Silver' then prices[1..3]
      when 'Gold' then prices[2..3]
      when 'Platinum' then [prices.last]
    end
  end
end

      # bronze: @game.price_bronze_cents,
      # silver: @game.price_silver_cents,
      # gold: @game.price_gold_cents,
      # platinum: @game.price_platinum_cents
