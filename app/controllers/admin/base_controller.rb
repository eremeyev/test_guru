class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!
  
  private
  
  def admin_required!
    redirect_to root_path, alert: "You are not authorized to see page #{url_for(params.permit)}. You has been redirected to page 'About'" unless current_user.is_a?(Admin)
  end
end
