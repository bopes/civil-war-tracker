class Event < ActiveRecord::Base

  belongs_to :location, inverse_of: :events
  belongs_to :link, polymorphic: true, inverse_of: :event
  has_and_belongs_to_many :players

end
