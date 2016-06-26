class Battle < ActiveRecord::Base
  belongs_to :location
  belongs_to :victor, class_name: "Side"
  belongs_to :campaign
end
