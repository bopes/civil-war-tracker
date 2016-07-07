class BattlesController < ApplicationController
  def index
    battles = Battle.where(campaign: nil)
    campaigns = Campaign.all
    @engagements = battles + campaigns
  end

  def show
    @battle = Battle.find(params[:id])
    @battleName = @battle.name
    battle_location = { lat: @battle.location.lat,
                        lng: @battle.location.long}
    @locations = [battle_location]
  end
end
