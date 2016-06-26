class Campaign < ActiveRecord::Base

  belongs_to :army, inverse_of: :campaigns
  has_many :battles

  def side
    army.side
  end

end
