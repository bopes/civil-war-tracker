class Event < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :location
end
