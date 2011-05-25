class ParticipantController < ApplicationController
  def new
    @participant = Participant.new()
  end

  def create
    @participant = Participant.new(params[:participant])
    if @participant.save
      flash[:notice] = "Erster Schritt erfolgreich, Benutzer angelet"
      redirect_to :action => "new", :controller => "upload_item", :participant_id => @participant 
    else
        flash[:error] = @participant.errors
        render :action => "new"
    end

  end
end
