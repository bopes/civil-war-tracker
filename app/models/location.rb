class Location < ActiveRecord::Base

  default_scope { order(:state).order(:city) }

  has_many :battles
  has_many :events

  validates :state, presence: true
  validates :county, presence: true
  validates :lat, presence: true
  validates :long, presence: true

  def coordinates
    {lat: self.lat, lng: self.long }
  end

  def name
    if !(self.location_name.blank?)
      self.location_name
    elsif self.city.blank?
      "#{self.county}, #{self.state}"
    else
      "#{self.city}, #{self.state}"
    end
  end

  def long_name
    city = ""
    city = "#{self.city}, " unless self.city.blank?
    return "#{city}#{self.state} (#{self.county})"
  end

  def all_events
    self.battles + self.events
  end

end
