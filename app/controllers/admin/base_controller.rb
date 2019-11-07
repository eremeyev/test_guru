class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!
  
  private
  
  def admin_required!
    alert = "You are not authorized to see page #{url_for(params.permit)}. 
            You has been redirected to page 'About'"
    redirect_to root_path, alert: alert unless current_user.admin?
  end
end
