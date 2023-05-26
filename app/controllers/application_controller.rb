class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(resource)
    current_user.admin? ? admin_tests_path : root_path
  end

end
