class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]

  def show
    render json: @player
  end

  def create
    game = Game.find(params[:game_id])

    @player = game.players.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      head :no_content
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy

    head :no_content
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name)
  end
end
