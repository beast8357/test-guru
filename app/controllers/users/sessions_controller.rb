class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('controllers.users.sessions.hello', user_name: current_user.first_name)
  end
end
