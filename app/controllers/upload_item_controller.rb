class UploadItemController < ApplicationController
  def new
    @participant = Participant.find(params[:participant_id])
    @upload_item = UploadItem.new()
    @upload_item.participant = @participant
  end
  
  def create
    @upload_item = UploadItem.new(params[:upload_item])
    @participant = Participant.find(params[:id])
    @upload_item.participant = @participant
    
    if @upload_item.save
      flash[:notice] = "Upload completed"
      redirect_to :action => "new", :participant_id => @participant
    else
      flash[:error] = @upload_item.errors
      render :action => "new", :participant_id => @participant
    end
    
  end

  def edit
  end

end
