class Location < ActiveRecord::Base

  default_scope { order(:state).order(:city) }

  has_many :battles
  has_many :events

  def coordinates
    {lat: self.lat, lng: self.long }
  end

  def name
    if self.location_name
      self.location_name
    elsif self.city.blank?
      "#{self.county}, #{self.state}"
    else
      "#{self.city}, #{self.state}"
    end
  end

  def all_events
    self.battles + self.events
  end

end
