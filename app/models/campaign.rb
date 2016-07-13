class Campaign < ActiveRecord::Base

  default_scope { order(:begin_date) }

  belongs_to :army, inverse_of: :campaigns
  has_many :battles
  has_many :events
  has_one :side, through: :army

  validates :begin_date, presence: true
  validates :army_id, presence: true

  def all_events
    (self.battles + self.events).sort_by! { |event| event.begin_date }
  end

  def location_coordinates
    self.all_events.map{ |event| event.location.coordinates }
  end

  def commanders
    Rank.where(army: self.army).select { |rank| rank.begin_date <= self.end_date && (rank.end_date == nil || rank.end_date >= self.begin_date) }
  end

end
