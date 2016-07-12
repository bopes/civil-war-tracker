class EventsController < ApplicationController
  def index
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
  end

  def edit

  end

  def update

  end
end
