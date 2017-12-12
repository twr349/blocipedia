class CollaboratorsController < ApplicationController
  
   def create
      
      
      @user = User.find_by_email(params[:user_email])
      @wiki = Wiki.find_by_id(params[:wiki_id])
     
      if @wiki.collaborators.exists?(user_id: @user.id)
        flash[:notice] = "#{@user.email} is already on the team."
        redirect_to edit_wiki_path(@wiki)
      
      else
     
      @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @user.id)
     
       if @collaborator.save
        
        
        flash[:notice] = "#{@user.email} is a new collaborator."
       
       
        redirect_to @wiki
      
       end
     end
   end

  def destroy
     @wiki = Wiki.find(params[:wiki_id])
     @collaborator = Collaborator.find(params[:id])
    
 
     if @collaborator.destroy
       flash[:notice] = "User was removed"
       redirect_to @wiki
     else
       flash.now[:alert] = "ERROR!!!!"
       redirect_to @wiki
     end
  end
 





end#end of ends


