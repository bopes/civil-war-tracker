class Campaign < ActiveRecord::Base

  belongs_to :army

  def side
    self.army.side
  end

end
