class Rank < ActiveRecord::Base
  default_scope { order(begin_date: :desc) }

  belongs_to :player, inverse_of: :ranks
  belongs_to :army

  def events
    army.events.select { |event| (self.begin_date..self.end_date).cover?(event.begin_date) }
  end

  def battles
    army.battles.select { |battle| (self.begin_date..self.end_date).cover?(battle.begin_date) }
  end

  def campaigns
    if self.end_date
      army.campaigns.select { |campaign| (self.begin_date..self.end_date).cover?(campaign.begin_date) }
    else
      army.campaigns.select { |campaign| self.begin_date < campaign.begin_date }
    end
  end

  def all_events
    events = (self.events + self.battles).reject { |e| e.campaign.army == self.army } + self.campaigns
    events.sort_by { |event| event.begin_date }
  end

end
