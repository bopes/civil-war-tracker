class Player < ActiveRecord::Base

  belongs_to :side, inverse_of: :players
  has_many :ranks, inverse_of: :player

end
