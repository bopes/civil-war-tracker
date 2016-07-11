class ArmiesController < ApplicationController
  def index
    @sides = Side.all
  end

  def new
    @sides = Side.all
    @battles = Battle.all
    @events = Event.all
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
  end

  def edit
    @sides = Side.all
    @battles = Battle.all
    @events = Event.all
    @army = Army.find(params[:id])
  end

  def update
    @army = Army.find(params[:id])
    if @army.update_attributes(army_params)

      @army.battles.delete_all
      @army.battles += Battle.where("id IN (?)", params[:army][:battles])

      @army.events.delete_all
      @army.events += Event.where("id IN (?)", params[:army][:events])

      flash[:success] = "#{@army.name} updated successfully."
      redirect_to @army
    else
      flash.now["Unable to save. Please try again."]
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
