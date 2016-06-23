class SidesController < ApplicationController
  def show
    @side = Side.find(params[:id])
  end

  def index
    @sides = Side.all
  end
end
