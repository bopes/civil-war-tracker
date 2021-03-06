class Side < ActiveRecord::Base

  has_many :armies, inverse_of: :side
  has_many :campaigns, through: :armies
  has_many :players, inverse_of: :side
  has_many :victories, foreign_key: "victor_id", class_name: "Battle"
end
