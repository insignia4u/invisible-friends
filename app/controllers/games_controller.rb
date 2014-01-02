class GamesController < ApplicationController

  before_action :authorize_user
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

  def index
  end

  def destroy
    game.destroy
    redirect_to root_path(), notice: "Game erased"
  end

  def shuffle
    Shuffler.new(game).shuffle!
    redirect_to root_path, notice: "Invitations sent"
  end

  def resend_notifications
    game.resend_notifications
    redirect_to root_path, notice: "Invitations sent"
  end

  protected
  def game_params
     params.require(:game).permit(:name, :scheduled_on, :description)
  end

end
