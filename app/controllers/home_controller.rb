class HomeController < ApplicationController

  def index
  end

protected
  def games
     if current_user
       current_user.games
     end
  end
  helper_method :games

end
