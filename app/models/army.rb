class Army < ActiveRecord::Base

  belongs_to :side, inverse_of: :armies
  has_many :campaigns, inverse_of: :army
  has_many :battles, through: :campaigns
  has_and_belongs_to_many :events

end
