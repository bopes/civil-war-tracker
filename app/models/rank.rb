class Rank < ActiveRecord::Base

  belongs_to :player
  belongs_to :army

end
