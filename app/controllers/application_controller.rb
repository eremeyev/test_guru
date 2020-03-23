class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def about
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:locale]) ? params[:locale] : I18n.default_locale
  end

  def default_url_options
    params[:locale] != I18n.default_locale.to_s ? { locale: I18n.locale } : {}   
  end
  
  def after_sign_in_path_for(user)
    current_user.admin? ? admin_tests_path : root_path
  end
  
  def feedback
    @resource = current_user
  end

  def submit_feedback
    ApplicationMailer.submit_feedback(params[:text]).deliver_now
  end
end
