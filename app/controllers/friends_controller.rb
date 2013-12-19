class FriendsController < ApplicationController

  before_action :authorize_user

  expose(:game){ current_user.games.find(params[:game_id]) }

  def index
  end

end
