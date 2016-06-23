class Army < ActiveRecord::Base

  belongs_to :side
  has_many :campaigns

end
