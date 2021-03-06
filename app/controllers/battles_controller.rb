class BattlesController < ApplicationController
  def index
    @battles = Battle.all
  end

  def show
    @sides = Side.all
    @battle = Battle.find(params[:id])
    @battleName = @battle.name
    battle_location = { lat: @battle.location.lat,
                        lng: @battle.location.long}
    @locations = [battle_location]
  end

  def new
    @sides = Side.all
    @campaigns = Campaign.all
    @locations = Location.all
    @battle = Battle.new
    @battle.campaign =  Campaign.find(params[:campaign_id]) if params[:campaign_id]
    if params[:army_id]
      army = Army.find(params[:army_id])
      @battle.armies << army
    end
  end

  def create
    @battle = Battle.create(battle_params)
    if @battle.save
      @battle.armies += Army.where("id IN (?)", params[:battle][:armies])
      flash[:success] = "#{@battle.name} added successfully!"
      redirect_to @battle
    else
      @sides = Side.all
      @campaigns = Campaign.all
      @locations = Location.all
      flash.now[:danger] = "Unable to save. Please try again."
      render 'new'
    end
  end

  def edit
    @sides = Side.all
    @campaigns = Campaign.all
    @locations = Location.all
    @battle = Battle.find(params[:id])
  end

  def update
    @battle = Battle.find(params[:id])
    if @battle.update(battle_params)
      @battle.armies.delete_all
      @battle.armies += Army.where("id IN (?)", params[:battle][:armies])
      flash[:success] = "#{@battle.name} updated successfully!"
      redirect_to @battle
    else
      @sides = Side.all
      @campaigns = Campaign.all
      @locations = Location.all
      flash.now[:danger] = "Unable to save. Please try again."
      render 'edit'
    end
  end

  def destroy
    @battle = Battle.find(params[:id])
    @battle.delete
    redirect_to engagements_url
  end

  private

    def battle_params
      params.require(:battle).permit(:begin_date, :end_date, :location_id, :victor_id, :campaign_id, :conclusion, :description, :name)
    end
end
