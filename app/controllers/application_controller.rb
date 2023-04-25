class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    redirect_to login_path, alert: 'Please, verify your email and password' unless current_user

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
