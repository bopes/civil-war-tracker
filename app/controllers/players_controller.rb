class PlayersController < ApplicationController
  def index
    @union_players = find_union(Player)
    @confederate_players = find_confederates(Player)
  end

  def show
    @player = Player.find(params[:id])
  end
end
