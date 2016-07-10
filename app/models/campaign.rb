class Campaign < ActiveRecord::Base

  belongs_to :army, inverse_of: :campaigns
  has_many :battles
  has_many :events

  def side
    army.side
  end

  def all_events
    (self.battles + self.events).sort_by! { |event| event.begin_date }
  end

  def location_coordinates
    self.all_events.map{ |event| event.location.coordinates }
  end

  def commanders
    Rank.where(army: self.army).select { |rank| rank.begin_date < self.begin_date && rank.end_date > self.end_date }
  end

end
