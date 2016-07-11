class LocationsController < ApplicationController
  def index
    @locations = Location.order(:state).order(:city)
  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def location_params

    end

end
