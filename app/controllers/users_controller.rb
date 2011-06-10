class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :list]
  
  def index
    redirect_to :action => "show"
  end
  
  def list
    @users = User.find(:all)
  end
  
  def show
    @user = current_user
    if current_user.story.length > 0
      @story = current_user.story.first
    end
  end
   
  def new
    @user = User.new
    #@user_information = UserÍnformation.new
  end
  
  def create
    @user = User.new(params[:user])
#    if @user.save
    if verify_recaptcha(:model => @user, :message => "Recaptcha wrong, try again") && @user.save
      flash[:notice] = "Registration successful."
      redirect_to new_story_url  
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
      redirect_to user_url 
    else
      flash[:error] = @user.errors
      render :action => 'edit'
    end
  end
end