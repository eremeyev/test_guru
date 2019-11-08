class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def about
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:locale]) ? params[:locale] : I18n.default_locale
  end

  def default_url_options
    return { locale: I18n.locale } if params[:locale] != I18n.default_locale.to_s
    {}
  end
  
  def after_sign_in_path_for(user)
    return admin_tests_path if current_user.admin?
    root_path
  end
end
