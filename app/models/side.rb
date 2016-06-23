class Side < ActiveRecord::Base

  has_many :armies
  has_many :campaigns, through: :armies
  has_many :players

end
