class GamesController < ApplicationController

  expose(:games) { current_user.games }
  expose(:game, attributes: :game_params)

  def new
  end

  def create
    if game.save
      redirect_to game_friends_path(game)
    else
      render :new
    end
  end

  protected
  def game_params
     params.require(:game).permit(:name, :scheduled_on, :description)
  end

end
