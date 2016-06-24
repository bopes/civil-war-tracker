class Rank < ActiveRecord::Base

  belongs_to :player, inverse_of: :ranks
  belongs_to :army

end
