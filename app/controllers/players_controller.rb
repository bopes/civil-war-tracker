class PlayersController < ApplicationController
  def index
    @sides = Side.all
  end

  def show
    @player = Player.find(params[:id])
    @ranks = @player.ranks.sort_by { |rank| rank.begin_date}.reverse
  end

  def new
    @sides = Side.all
    @events = Event.order(:begin_date)
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    if @player.save
      # @player.battles += Battle.where("id IN (?)", params[:army][:battles])
      # @army.events += Event.where("id IN (?)", params[:army][:events])
      flash[:success] = "#{@player.name} added successfully!"
      redirect_to @player
    else
      flash.now[:danger] = "Unable to save. Please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @player = Player.find(params[:id])
    @player.delete
    redirect_to players_path
  end

  private

    def player_params
      params.require(:player).permit(:name, :side_id, :bio)
    end

end
