class Player < ActiveRecord::Base

  belongs_to :side, inverse_of: :players
  has_many :ranks, inverse_of: :player
  has_and_belongs_to_many :events

end
