class CollaboratorsController < ApplicationController
  
   def create
      
      
      @user = User.find_by_email(params[:user_email])
      @wiki = Wiki.find_by_id(params[:wiki_id])
     
      
      @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @user.id)
     
       if @collaborator.save
        
        
        flash[:notice] = "#{@user.email} is a new collaborator."
       
       
        redirect_to @wiki
      
       end
   end

  def destroy
     @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
 
     if @collaborator.destroy
       flash[:notice] = "Delete successfull"
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error"
       redirect_to @wiki
     end
  end
 





end#end of ends


