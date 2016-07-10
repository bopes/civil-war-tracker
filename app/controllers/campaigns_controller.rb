class CampaignsController < ApplicationController
  def index
    union = Side.find_by(name: "The Union")
    @union_campaigns = Campaign.all.select { |campaign| campaign.side == union }

    confederacy = Side.find_by(name: "The Confederacy")
    @confederate_campaigns = Campaign.all.select { |campaign| campaign.side == confederacy }
  end

  def show
    @campaign = Campaign.find(params[:id])

    # @all_events = (@campaign.battles + @campaign.events).sort_by! { |event| event.begin_date }

    # @locations = @all_events.map{ |event| {lat: event.location.lat, lng: event.location.long } }

    # @commanders = Rank.where(army: @campaign.army).select { |rank| rank.begin_date < @campaign.begin_date && rank.end_date > @campaign.end_date }
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.create(campaign_params)
    if @campaign.save
      flash[:success] = "#{@campaign.name} added successfully!"
      redirect_to @campaign
    else
      flash.now[:danger] = "Unable to save. Please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :army_id, :begin_date, :end_date)
  end
end
