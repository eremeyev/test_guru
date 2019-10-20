class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :authenticate_user!, except: [:about]
  
  helper_method :current_user,
                :logged_in?

  def about
  end
  
  

  private
  
  def authenticate_user!
    unless current_user
      cookies[:desired_url] = url_for(params.permit)
      redirect_to login_path
    end
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user.present?
  end
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
