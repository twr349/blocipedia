class CollaboratorsController < ApplicationController
  def index
    @collaborators = Collaborator.all
  end
  
  def new
     @collaborator = Collaborator.new
     
  end
 
   def create
      @collaborator_user = User.find_by_email(params[:user_email])
      @wiki = Wiki.find_by_id(params[:wiki_id])
      
      @collaborator = Collaborator.new
      if @collaborator.save
        flash[:notice] = "#{@collaborator_user.email} is a new collaborator."
        redirect_to @wiki
      
      end
   end

  def destroy
    
  end

end#end of ends


