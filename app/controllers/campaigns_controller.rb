class CampaignsController < ApplicationController
  def index
    @sides = Side.all
  end

  def new
    @campaign = Campaign.new(army_id: params[:army_id])
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

  def show
    @campaign = Campaign.find(params[:id])
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.create(campaign_params)
    if @campaign.save
      flash[:success] = "#{@campaign.name} added successfully!"
      redirect_to @campaign
    else
      flash.now[:danger] = "Unable to save. Please try again."
      render 'new'
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @army = @campaign.army
    @campaign.delete
    redirect_to @army
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :army_id, :begin_date, :end_date)
  end
end
