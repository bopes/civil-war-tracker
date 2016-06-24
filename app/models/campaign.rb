class Campaign < ActiveRecord::Base

  belongs_to :army, inverse_of: :campaigns
  has_one :event, as: :link
  has_many :battles, inverse_of: :campaign

  def side
    army.side
  end

end
