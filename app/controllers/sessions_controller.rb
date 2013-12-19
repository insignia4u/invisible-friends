class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])

    message = "We couldn't sign you in."
    unless user.new_record?
      session[:user_id] = user.id
      message = "You're logged in."
    end

    redirect_to root_url, notice: message
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
