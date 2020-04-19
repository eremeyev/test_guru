class Admin::BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end
  
  def edit
    @badge = Badge.find(params[:id])
  end
  
  def new
    @badge = Badge.new(image: 'star', color: 'red')
  end
  
  def update
    @badge = Badge.find(params[:id])  
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render action: :edit
    end
  end
  
  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render action: :new
    end
  end
  
  def destroy
    
  end
  
  private
  
  def badge_params
    params.require(:badge).permit(:name, :image, :color, rule_ids: [])
  end
  
end
