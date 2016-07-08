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

  def locations
    (self.events + self.battles).map { |event| {lat: event.location.lat, lng: event.location.long } }
  end

end
