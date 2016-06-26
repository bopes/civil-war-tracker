class BattlesController < ApplicationController
  def index
  end

  def show
    @battle = Battle.find(params[:id])
  end
end
