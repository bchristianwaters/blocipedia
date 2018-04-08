class CollaboratorsController < ApplicationController
    def create
        wiki = Wiki.find(params[:wiki_id])
        if collaborator_params[:user_id].include?("@")
            user_id = User.find_by(email: collaborator_params[:user_id]).id
            collaborator = wiki.collaborators.new(:user_id => user_id)
        else
            collaborator = wiki.collaborators.new(collaborator_params)
        end
        
        if collaborator.save
            redirect_to wiki
            flash[:notice] = "Collaborator added."
        else
            redirect_to wiki
            flash[:alert] = "Failed to add collaborator."
        end
    end
    
    def destroy
        collaborator = Collaborator.find(params[:id])
        wiki = collaborator.wiki
        if collaborator.destroy
            redirect_to wiki
            flash[:notice] = "Collaborator removed."
        else
            redirect_to wiki
            flash[:alert] = "Failed to remove collaborator."
        end
    end
    
    private
    
    def collaborator_params
        params.require(:collaborator).permit(:user_id)
    end 
end