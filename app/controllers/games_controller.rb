class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    @games = Game.all

    render json: @games
  end

  def show
    render json: @game
  end

  def create
    game_creator = CreateGame.new

    if game_creator.call
      @game = game_creator.game

      render json: @game, status: :created, location: @game
    else
      render json: game_creator.errors, status: :unprocessable_entity
    end
  end

  # def update
  #   @game = Game.find(params[:id])

  #   if @game.update(game_params)
  #     head :no_content
  #   else
  #     render json: @game.errors, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @game.destroy

    head :no_content
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
