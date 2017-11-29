class DowngradesController < ApplicationController
  def new
  end
  
  def create
   current_user.update_attribute(:role, 'Standard') 
 
   flash[:notice] = "#{current_user.email} is now a #{current_user.role} member!"
   redirect_to root_path 
  end
  
end
