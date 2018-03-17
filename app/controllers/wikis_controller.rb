 class WikisController < ApplicationController
   
   def index
     @wikis = Wiki.all
   end
    
   def show
     @wiki = Wiki.find(params[:id])
     authorize @wiki
   end
    
   def new
     @wiki = Wiki.new
     authorize @wiki
   end
    
   def create
      @wiki = Wiki.new(wiki_params)
      authorize @wiki
      @wiki.user = current_user

     if @wiki.save
       redirect_to @wiki
     else
       render :new
     end 
   end
   
   def edit
     @wiki = Wiki.find(params[:id])
     authorize @wiki
   end
  
   def update
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     @wiki.assign_attributes(wiki_params)
 
     if @wiki.save
       redirect_to @wiki
     else
       render :edit
     end
   end
   
   def destroy
     @wiki = Wiki.find(params[:id])
     authorize @wiki
 
     if @wiki.destroy
       redirect_to action: :index
     else
       render :show
     end
   end
    
   private
   def wiki_params
     params.require(:wiki).permit(:title, :body, :private)
   end
 end
