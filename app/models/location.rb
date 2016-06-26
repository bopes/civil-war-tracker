class Location < ActiveRecord::Base

  has_many :battles
  has_many :events

end
