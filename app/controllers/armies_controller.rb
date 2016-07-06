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
      @army.battles += Battle.where("id IN (?)", params[:army][:battles])
      @army.events += Event.where("id IN (?)", params[:army][:events])
      flash[:success] = "Army successfully created."
      redirect_to @army
    else
      render 'new'
    end
  end

  def show
    @army = Army.find(params[:id])
    @all_events = @army.battles + @army.events
    @all_events.sort_by! { |event| event.begin_date }
  end

  def edit
    @army = Army.find(params[:id])
  end

  def update
    @army = Army.find(params[:id])
    if @army.update_attributes(army_params)

      @army.battles.delete_all
      @army.battles += Battle.where("id IN (?)", params[:army][:battles])

      @army.events.delete_all
      @army.events += Event.where("id IN (?)", params[:army][:events])
      flash[:success] = "Army successfully updated."
      redirect_to @army
    else
      render 'edit'
    end
  end


  private

    def army_params
      params.require(:army).permit(:name, :side_id)
    end

end
