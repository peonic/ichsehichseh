class UploadItemController < ApplicationController
  before_filter :require_user
  
  def new
    @user = current_user
    @upload_item = UploadItem.new()
    @story = @user.story.first
  end
  
  def create
    @upload_item = UploadItem.new(params[:upload_item])
    @user = current_user
    @story = @user.story.first
    @upload_item.story = @story
    
    if @upload_item.save
      flash[:notice] = "Upload completed"
      redirect_to user_url(current_user)
    else
      flash[:error] = "errors occured"#@upload_item.errors.on
      render :action => 'new'
    end  
  end

  def edit
  end

end
