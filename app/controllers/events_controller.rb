class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @campaigns = Campaign.all
    @locations = Location.all
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      flash[:success] = "#{@event.name} added successfully!"
      redirect_to @event
    else
      flash.now[:danger] = "Unable to save. Please try again."
      render 'new'
    end
  end

  def edit
    @campaigns = Campaign.all
    @locations = Location.all
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "#{@event.name} updated successfully!"
      redirect_to @event
    else
      flash.now[:danger] = "Unable to save. Please try again."
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @campaign = @event.campaign if @event.campaign
    @event.destroy
    @campaign ? redirect_to @campaign : redirect_to engagements_url
  end

  private

    def event_params
      params.require(:event).permit(:name, :description, :location_id, :begin_date, :end_date, :campaign_id)
    end
end
