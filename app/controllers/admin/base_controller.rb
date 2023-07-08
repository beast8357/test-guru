class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path,
                alert: t('controllers.admin.base.unauthorized') unless
                current_user.admin?
  end

end
