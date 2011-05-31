class UploadItemController < ApplicationController
  before_filter :require_user
  
  def new
    @user = current_user
    @upload_item = UploadItem.new()
    @upload_item.user = @user
  end
  
  def create
    @upload_item = UploadItem.new(params[:upload_item])
    @user = current_user
    @upload_item.user = current_user
    
    if verify_recaptcha(:model => @upload_item, :message => "Oh! It's error with reCAPTCHA!") && @upload_item.save
      flash[:notice] = "Upload completed"
      redirect_to :action => "show", :id => @upload_item
    else
      flash[:error] = @upload_item.errors
      render :action => "new", :id => current_user
    end
    
  end

  def edit
  end

end
