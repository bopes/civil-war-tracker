class ArmiesController < ApplicationController
  def index
    @union_armies = find_union(Army)
    @confederate_armies = find_confederates(Army)
  end

  def show
    @army = Army.find(params[:id])
    @all_events = @army.battles + @army.events
  end
end
