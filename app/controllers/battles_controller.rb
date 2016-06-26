class BattlesController < ApplicationController
  def index
  end

  def show
    @battle = Battle.find_by(params[:id])
  end
end
