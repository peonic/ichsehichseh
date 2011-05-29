class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "ERfolgreich Eingeloggt"
      redirect_to :controller => :upload_item, :action => :new  
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session = UserSession.find(params[:id])
    current_user_session.destroy
    redirect_to new_user_session_url
  end
end
