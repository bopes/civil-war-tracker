class BattlesController < ApplicationController
  def index
    @battles = Array.new
    Event.where(link_type: "Battle").each do |event|
      @battles << { battle: event.link,
                    date: event.begin_date,
                    name: event.desc,
                    victor: event.link.victor.name }
    end
  end

  def show
  end
end
