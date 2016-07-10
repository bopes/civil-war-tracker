class Battle < ActiveRecord::Base

  default_scope { order(:begin_date) }

  belongs_to :location
  belongs_to :victor, class_name: "Side"
  belongs_to :campaign
  has_and_belongs_to_many :armies, inverse_of: :battles

  validates :location_id, presence: true
  validates :victor_id, presence: true

  def location_coordinates
    [self.location.coordinates]
  end

end
