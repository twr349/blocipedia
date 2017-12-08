class CollaboratorsController < ApplicationController
  def index
    @collaborators = Collaborator.all
  end
  
  def new
     @collaborator = Collaborator.new
     
  end
 
   def create
      @collaborator = User.find_by_email(params[:user_email])
      @wiki = Wiki.find_by_id(params[:wiki_id])
      
     
      if @collaborator.save
        
        flash[:notice] = "#{@collaborator.email} is a new collaborator."
        redirect_to @wiki
      
      end
   end

  def destroy
    
  end
private
  def collaborators_params
    params.require(:collaborator).permit(:user_email, :wiki_id, collaborators:[])
  end

end#end of ends


