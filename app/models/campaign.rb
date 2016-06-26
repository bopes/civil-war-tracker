class Campaign < ActiveRecord::Base

  belongs_to :army, inverse_of: :campaigns

  def side
    army.side
  end

end
