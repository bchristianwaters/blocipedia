 class WikisController < ApplicationController
   
   def index
     @wikis = policy_scope(Wiki)
   end
    
   def show
     @wiki = Wiki.find(params[:id])
     authorize @wiki
   end
    
   def new
     @wiki = Wiki.new
     @users = User.all
     authorize @wiki
   end
    
   def create
      @wiki = Wiki.new(wiki_params)
      authorize @wiki
      @wiki.user = current_user
      @wiki.private = false if current_user.standard?
      @users = User.all

     if @wiki.save
       redirect_to @wiki
     else
       render :new
     end 
   end
   
   def edit
     @wiki = Wiki.find(params[:id])
     @users = User.all
     authorize @wiki
   end
  
   def update
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     @wiki.assign_attributes(wiki_params)
     @users = User.all

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
