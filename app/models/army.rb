class Army < ActiveRecord::Base

  belongs_to :side, inverse_of: :armies
  has_many :campaigns, inverse_of: :army
  has_and_belongs_to_many :battles, inverse_of: :armies
  has_and_belongs_to_many :events, inverse_of: :armies

  validates :side_id, presence: true
  validates :name, presence: true

  def all_events
    list = self.campaigns + self.events + self.battles.reject { |battle| battle.campaign.army == self }
    list.sort_by { |event| event.begin_date }
  end

  def location_coordinates
    (self.events + self.battles).map { |event| event.location.coordinates }
  end

  def commanders
    Rank.where(army: self).sort_by { |event| event.begin_date }.reverse
  end

end
