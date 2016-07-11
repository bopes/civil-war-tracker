class LocationsController < ApplicationController
  def index
    @locations = Location.order(:state).order(:city)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)

  end

  def show
    @location = Location.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def location_params
      params.require(:location).permit(:city, :state, :county)
    end

end
