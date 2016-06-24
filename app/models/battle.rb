class Battle < ActiveRecord::Base

  belongs_to :campaign, inverse_of: :battles
  has_one :event, as: :link, inverse_of: :link
  has_and_belongs_to_many :players
  has_and_belongs_to_many :armies
  belongs_to :victor, class_name: "Side"

end
