class Event < ActiveRecord::Base

  default_scope { order(:begin_date) }

  belongs_to :campaign
  belongs_to :location
  has_and_belongs_to_many :armies, inverse_of: :battles

  def location_coordinates
    [self.location.coordinates]
  end

end
