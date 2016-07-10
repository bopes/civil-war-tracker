class Player < ActiveRecord::Base

  belongs_to :side, inverse_of: :players
  has_many :ranks, inverse_of: :player

  def battles
    battles = []
    ranks.each { |rank| battles += rank.battles }
    battles
  end

  def events
    events = []
    ranks.each { |rank| events += rank.events }
    events
  end

  def campaigns
    campaigns = []
    ranks.each { |rank| campaigns += rank.campaigns }
    campaigns
  end

  def all_events
    events = []
    ranks.each { |rank| events += rank.all_events }
    events
  end

  def location_coordinates
    (self.events + self.battles).map { |event| event.location.coordinates }
  end

end
