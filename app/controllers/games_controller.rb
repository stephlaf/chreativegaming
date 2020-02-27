class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except: [:index, :show]

  def index
    @games = policy_scope(Game)
  end

  def show
  end

  def new
    @game = Game.new
    authorize @game
  end

  def create
    # raise
    @game = Game.new(game_params)
    authorize @game

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
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
    params.require(:game).permit(:name, :description, :category, :level, :price_cents, :status, :thumbnail)
  end
end
