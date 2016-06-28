class BattlesController < ApplicationController
  def index
  end

  def show
    @battle = Battle.find(params[:id])
    @battleName = @battle.name
    @latitude = @battle.location.lat
    @longitude = @battle.location.long
    @map_url = "https://maps.googleapis.com/maps/api/js?key=" + ENV["GOOGLE_MAPS_API_KEY"] + "&callback=initMap"
  end
end
