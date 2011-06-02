class UploadItemController < ApplicationController
  before_filter :require_user
  
  def new
    @user = current_user
    @upload_item = UploadItem.new()
    @story = @user.story.first
  end
  
  def create
    @upload_item = UploadItem.new(params[:upload_item])
    @upload_item.story = current_user.story.first
    
    if @upload_item.save
      flash[:notice] = "Upload completed"
      redirect_to user_url(current_user)
    else
      flash[:error] = @upload_item.errors
      render :aciotn => new
    end  
  end

  def edit
  end

end
