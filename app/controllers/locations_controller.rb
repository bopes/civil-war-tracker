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
      p params
      city = params[:location][:city]
      county = params[:location][:county]
      state = params[:location][:state]

      city.blank? ? place = "#{county}, #{state}" : place = "#{city}, #{state}"
      loc_raw = Geokit::Geocoders::GoogleGeocoder.geocode place
      return {  city: loc_raw.city,
                state: loc_raw.state_name,
                county: loc_raw.district,
                lat: loc_raw.lat,
                long: loc_raw.lng }
    end

end
