class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @my_badges = current_user.badges
  end
  
  def edit
    
  end
  
  def new
    @badge = Badge.new
  end
  
  def update
    
  end
  
  def create
    
  end
  
  def destroy
    
  end
  
  
end
