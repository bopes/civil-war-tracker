class Location < ActiveRecord::Base

  default_scope { order(:state).order(:city) }

  has_many :battles
  has_many :events

  def coordinates
    {lat: self.lat, lng: self.long }
  end

  def name
    "#{self.city}, #{self.state}"
  end

  def all_events
    self.battles + self.events
  end

end
