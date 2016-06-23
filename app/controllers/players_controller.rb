class PlayersController < ApplicationController
  def index
    @union_players = Player.where(side: 1)
    @confederate_players = Player.where(side: 2)
  end

  def show
    @player = Player.find(params[:id])
  end
end
