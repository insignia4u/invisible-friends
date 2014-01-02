class FriendsController < ApplicationController

  before_action :authorize_user

  expose(:game){ current_user.games.find(params[:game_id]) }
  expose(:friends){ game.friends }

  expose(:invitation_manager) { InvitationManager.new(params[:invitation_manager]) }

  def index
  end

  def new
  end


  def create
    invitation_manager.game = game

    if invitation_manager.invite
      redirect_to game_friends_path(game), notice: "User #{invitation_manager.name} (#{invitation_manager.email}) invited to the game"
    else
      render :new
    end
  end

  def destroy
    game.game_invitations.find_by(user_id: params[:id]).destroy
    redirect_to game_friends_path(game), notice: "User removed from the game"
  end

end
