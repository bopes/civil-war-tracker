class Location < ActiveRecord::Base

  has_many :events, inverse_of: :location

end
