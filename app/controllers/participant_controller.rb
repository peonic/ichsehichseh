class ParticipantController < ApplicationController
  def new
    @participant = Participant.new()
  end

  def create
    @participant = Participant.new(params[:participant])
    if verify_recaptcha(:model => @participation, :message => "Oh! It's error with reCAPTCHA!") && @participant.save
      flash[:notice] = "Erster Schritt erfolgreich, Benutzer angelet"
      redirect_to :action => "new", :controller => "upload_item", :participant_id => @participant 
    else
        flash[:error] = @participant.errors
        render :action => "new"
    end
  end
  
  def show
    @participant = Participant.find(params[:id])
    @upload_items = @participant.upload_item
  end
  
end
