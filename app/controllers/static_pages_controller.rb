class StaticPagesController < ApplicationController
  def home
    @sides = Side.all
  end

  def engagements
    @sides = Side.all
    @battles = Battle.where(campaign: nil)
    @events = Event.where(campaign: nil)
  end
end
