class BattlesController < ApplicationController
  def index
  end

  def show
    @battle = Battle.find(params[:id])
    @battleName = @battle.name
    battle_location = { lat: @battle.location.lat,
                        lng: @battle.location.long}
    @locations = [battle_location]
    # @latitude = @battle.location.lat
    # @longitude = @battle.location.lng
  end
end
