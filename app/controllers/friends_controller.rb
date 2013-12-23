class FriendsController < ApplicationController

  before_action :authorize_user

  expose(:game){ current_user.games.find(params[:game_id]) }
  expose(:friends){ game.friends }

  #hace falta??
  expose(:friend, attributes: :friend_params, model: :user)

  def index
  end

  def new
  end

  def create
    friend = User.find_by(email: friend_params[:email])
    if friend.nil?
      friend = User.new(friend_params)
      unless friend.save
        # ???
        render :new, locals: { errors: friend.errors } and return
      end
    end
    if game.add_friend(friend)
      redirect_to game_friends_path(game), notice: "User #{friend.name} (#{friend.email}) invited to the game"
    else
      redirect_to game_friends_path(game), notice: "User #{friend.name} (#{friend.email}) is already invited to the game"
    end
  end

  private
  def friend_params
    params.require(:user).permit(:name, :email)
  end

end
