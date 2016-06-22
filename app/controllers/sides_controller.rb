class SidesController < ApplicationController
  def show
    @side = Side.find_by(params[:id])
  end

  def index
    @sides = Side.all
  end
end
