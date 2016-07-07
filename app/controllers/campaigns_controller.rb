class CampaignsController < ApplicationController
  def index
    union = Side.find_by(name: "The Union")
    @union_campaigns = Campaign.all.select { |campaign| campaign.side == union }

    confederacy = Side.find_by(name: "The Confederacy")
    @confederate_campaigns = Campaign.all.select { |campaign| campaign.side == confederacy }
  end

  def show
    @campaign = Campaign.find(params[:id])
    @all_events = @campaign.battles + @campaign.events
    @all_events.sort_by! { |event| event.begin_date }
    @locations = @all_events.map{ |event| {lat: event.location.lat, lng: event.location.long } }
    # @commanders = Rank.where("army = ? AND begin_date < ? AND end_date > ?", @campaign.army, @campaign.begin_date, @campaign.end_date)
    @commanders = Rank.where(army: @campaign.army)
    @commanders.select { |rank| rank.begin_date < @campaign.begin_date && rank.end_date > @campaign.end_date }

  end
end
