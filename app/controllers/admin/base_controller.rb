class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!
  
  private
  
  def admin_required!
    redirect_to root_path, alert: t('alert_if_admin_required') unless current_user.admin?
  end
end
