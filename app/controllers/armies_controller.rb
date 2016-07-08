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
      flash[:success] = "#{@army.name} added successfully!"
      redirect_to @army
    else
      flash.now[:danger] = "Unable to save. Please try again."
      render 'new'
    end
  end

  def show
    @army = Army.find(params[:id])

    @all_events = @army.campaigns + @army.events + @army.battles.reject { |battle| battle.campaign.army == @army }
    @all_events.sort_by! { |event| event.begin_date }

    @locations = (@army.events + @army.battles).map { |event| {lat: event.location.lat, lng: event.location.long } }

    @commanders = Rank.where(army: @army).sort_by { |event| event.begin_date }.reverse
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

  def destroy
    @army = Army.find(params[:id])
    @army.delete
    redirect_to armies_path
  end


  private

    def army_params
      params.require(:army).permit(:name, :side_id)
    end

end
