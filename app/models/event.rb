class Event < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :location
  has_and_belongs_to_many :armies, inverse_of: :battles
end
