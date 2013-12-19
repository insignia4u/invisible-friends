class FriendsController < ApplicationController

  expose(:game){ current_user.games.find_by(id: params[:id]) }

  def index
  end

end
