class Rank < ActiveRecord::Base

  belongs_to :player, inverse_of: :ranks
  belongs_to :army

  def events
    army.events.select { |event| (self.begin_date..self.end_date).cover?(event.begin_date) }
  end

  def battles
    army.battles.select { |battle| (self.begin_date..self.end_date).cover?(battle.begin_date) }
  end

  def campaigns
    army.campaigns.select { |campaign| (self.begin_date..self.end_date).cover?(campaign.begin_date) }
  end

  def all_events
    events = self.events + self.campaigns + self.battles.reject { |battle| battle.campaign.army == self.army }
    events.sort_by { |event| event.begin_date }
  end

end
