class Battle < ActiveRecord::Base

  belongs_to :location
  belongs_to :victor, class_name: "Side"
  belongs_to :campaign
  has_and_belongs_to_many :armies, inverse_of: :battles

  validates :location_id, presence: true
  validates :victor_id, presence: true

end
