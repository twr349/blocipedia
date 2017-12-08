class CollaboratorsController < ApplicationController
  
  
  def new
     @collaborator = Collaborator.new
     
  end
  
  
 
   def create
     # first, identify collaborator by email/ id
     #@collaborator
     #@collaborator_user
     # add above email to collaborators array
      #@wiki.collaborators << @collaborator
      @collaborator = User.find_by_email(params[:user_email])
      @wiki = Wiki.find_by_id(params[:wiki_id])
      
      @collaborator = Collaborator.new
      
      
      if @collaborator.save
        #@wiki.collaborators << @collaborator
        @wiki.collaborators << @collaborator.email
        #@wiki.collaborators << @collaborator_user
        flash[:notice] = "#{@collaborator.email} is a new collaborator."
        redirect_to @wiki
      
      end
   end
   
   def update
    
   end 

  def destroy
    
  end

end#end of ends


