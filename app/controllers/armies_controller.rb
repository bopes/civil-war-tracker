class ArmiesController < ApplicationController
  def index
    @union_armies = find_union(Army)
    @confederate_armies = find_confederates(Army)
  end

  def new
    @army = Army.new
  end

  def create
    @army = Army.create(army_params)
    if @army.save
      flash[:success] = "Army successfully created."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @army = Army.find(params[:id])
    @all_events = @army.battles + @army.events
  end

  private

    def army_params
      params.require(:army).permit(:name, :side_id)
    end

end
