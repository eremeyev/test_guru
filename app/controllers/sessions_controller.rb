class SessionsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:desired_url]
    else
      flash.now[:alert] = "Are you a guru? Verify your email and password."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash.now[:alert] = "You have logged out."
    redirect_to login_path
  end
  
  private
  
  def user_params
    params.permit(:email, :password)
  end
end
