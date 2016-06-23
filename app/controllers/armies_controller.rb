class ArmiesController < ApplicationController
  def index
    @armies = Army.all
  end

  def show
    @army = Army.find(params[:id])
  end
end
