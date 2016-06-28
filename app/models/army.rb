class Army < ActiveRecord::Base

  belongs_to :side, inverse_of: :armies
  has_many :campaigns, inverse_of: :army
  has_and_belongs_to_many :battles
  has_and_belongs_to_many :events

  validates :side, presence: true
  validates :name

end
