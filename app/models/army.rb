class Army < ActiveRecord::Base

  belongs_to :side, inverse_of: :armies
  has_many :campaigns, inverse_of: :army
  has_and_belongs_to_many :battles, inverse_of: :armies
  has_and_belongs_to_many :events, inverse_of: :armies

  validates :side_id, presence: true
  validates :name, presence: true

end
