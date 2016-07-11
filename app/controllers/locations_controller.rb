class LocationsController < ApplicationController
  def index
    @locations = Location.order(:state).order(:city)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    if @location.save
      flash[:success] = "Location added successfully!"
      redirect_to @location
    else
      flash.now[:danger] = "Unable to find location. Please try again."
      render 'new'
    end
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
      city = params[:location][:city]
      state = params[:location][:state]
      loc_raw = Geokit::Geocoders::GoogleGeocoder.geocode "#{city}, #{state}"
      return {  city: city,
                state: loc_raw.state_name,
                county: loc_raw.district,
                lat: loc_raw.lat,
                long: loc_raw.lng }
    end

end
