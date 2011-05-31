class StoriesController < ApplicationController
  before_filter :require_user
    
  def show
    @story = current_user.story.first
    @user = current_user
  end
    
  def new
    if current_user.story.length > 0
      flash[:notice] = "Es kann nur eine Fotogeschichte eingereicht werden"
      redirect_to story_url(current_user.story.first)
    else
      @story = Story.new 
      @user = current_user
    end  
  end

  def create
    @story = Story.new(params[:story])
    @story.user = current_user
    if @story.save
      flash[:notice] = "Erfolgreich angelegt"
      redirect_to :controller => :upload_items, :action => :new, :id => @story
    else
      flash[:error] = @story.errors
      redirect_to new_story_url
    end
  end
  
  def edit
    @story = current_user.story.first
    @user = current_user
  end
  
  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:notice] = "Erfolgreich angelegt"
      redirect_to new_upload_item_url
    else
      flash[:error] = @story.errors
      redirect_to new_story_url
    end
  end
end
