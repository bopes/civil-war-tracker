class PlayersController < ApplicationController
  def index
  end

  def show
    @player = Player.find_by(params[:id])
  end
end
