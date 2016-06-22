class ArmiesController < ApplicationController
  def index
    @armies = Army.all
  end

  def show
    @army = Army.find_by(params[:id])
  end
end
