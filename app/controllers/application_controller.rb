class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authorize

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  protected
  def authorize
    unless current_user
      redirect_to root_path, notice: "Please Log In"
    end
  end

end
