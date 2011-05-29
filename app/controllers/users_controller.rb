class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
#    if verify_recaptcha(:model => @user, :message => "Recaptcha wrong, try again") && @user.save
      flash[:notice] = "Registration successful."
      redirect_to :controller => :upload_item, :action => :new, :id => @user
    else
      flash[:error] = @user.errors
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end