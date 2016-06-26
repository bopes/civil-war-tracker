class Campaign < ActiveRecord::Base

  belongs_to :army, inverse_of: :campaigns
  has_many :battles
  has_many :events

  def side
    army.side
  end

end
