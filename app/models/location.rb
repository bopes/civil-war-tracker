class Location < ActiveRecord::Base

  has_many :battles
  has_many :events

  def coordinates
    {lat: self.lat, lng: self.long }
  end

end
