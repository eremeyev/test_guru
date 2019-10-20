class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.login = user_params[:email]
    @user.first_name = user_params[:email]
    @user.last_name = user_params[:email]
    if @user.save
      redirect_to user_tests_path(user_id: @user.id)
    else
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
