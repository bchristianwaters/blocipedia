class CollaboratorsController < ApplicationController
    def create
        @wiki = Wiki.find(params[:wiki_id])
        collaborator = @wiki.collaborators.new(collaborator_params)
        
        if collaborator.save
            redirect_to @wiki
        else
            redirect_to @wiki
        end
    end
    
    def destroy
        collaborator = Collaborator.find(params[:id])
        @wiki = collaborator.wiki
        if collaborator.destroy
            redirect_to @wiki
        else
            redirect_to @wiki
        end
    end
    
    private
    
    def collaborator_params
        params.require(:collaborator).permit(:user_id)
    end 
end