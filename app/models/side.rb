class Side < ActiveRecord::Base

  has_many :armies, inverse_of: :side
  has_many :campaigns, through: :armies
  has_many :players, inverse_of: :side
  has_many :victories, class_name: "Battle", foreign_key: "victor_id"

end
