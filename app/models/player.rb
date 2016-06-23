class Player < ActiveRecord::Base

  belongs_to :side
  has_many :ranks

end
