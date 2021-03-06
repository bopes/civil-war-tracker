class Rank < ActiveRecord::Base
  default_scope { order(begin_date: :desc) }

  belongs_to :player, inverse_of: :ranks
  belongs_to :army

  validates :begin_date, presence: true
  validates :player_id, presence: true
  validates :army_id, presence: true

  def events
    if self.end_date
      army.events.select { |event| (self.begin_date..self.end_date).cover?(event.begin_date) }
    else
      army.events.select { |event| self.begin_date < event.begin_date }
    end
  end

  def battles
    if self.end_date
      army.battles.select { |battle| (self.begin_date..self.end_date).cover?(battle.begin_date) }
    else
      army.battles.select { |battle| self.begin_date < battle.begin_date }
    end
  end

  def campaigns
    if self.end_date
      army.campaigns.select { |campaign| (self.begin_date..self.end_date).cover?(campaign.begin_date) }
    else
      army.campaigns.select { |campaign| self.begin_date < campaign.begin_date }
    end
  end

  def all_events
    events = (self.events + self.battles).reject { |e| e.campaign.army == self.army if e.campaign } + self.campaigns
    events.sort_by { |event| event.begin_date }
  end

end
