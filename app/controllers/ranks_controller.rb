class RanksController < ApplicationController
  def new
    @sides = Side.all
    @rank = Rank.new(player_id: params[:player_id])
  end

  def create
    @rank = Rank.create(rank_params)
    if @rank.save
      flash[:success] = "New rank successfully added for #{@rank.player.name}!"
      redirect_to @rank.player
    else
      flash.now[:danger] = "Unable to save. Please try again."
      render 'new'
    end
  end

  def edit
    @sides = Side.all
    @rank = Rank.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

    def rank_params
      params.require(:rank).permit(:player_id, :army_id, :title, :begin_date, :end_date)
    end
end
