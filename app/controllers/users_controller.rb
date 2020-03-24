class UsersController < ApplicationController
	skip_before_action :require_login, only: [:new, :create, :login]
  before_action :set_user, only: [:show, :update, :logout]	
  def new
  	@positions = Position.all
  end
  def create
  	@user = User.create(user_params)
  	if @user.valid?
  		session[:user_id] = @user.id
  		redirect_to "/home"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/'
  	end
  end
  def login
  	@user = User.find_by(email: params[:email])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to '/home'
  	else
  		flash[:alert]= "Incorrect username/password"
  		redirect_to '/'
  	end
  end
  def show
  	# @user = User.find_by(id: params[:id])
  	@positions = Position.all
    if !current_user.admin
  	  if @user != current_user
        redirect_to '/error'
      end
    end
  end
  def update
    # @user = User.find_by(id: params[:id])
    if !current_user.admin
      if @user != current_user
        redirect_to '/error'
      end
    end
    if @user.update(user_up)
      redirect_to "/timesheets"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}" 
    end
  end
  def logout
  	# @user = User.find_by(id: params[:id])
  	if @user != current_user
      redirect_to '/error'
    end
  	session.clear
  	redirect_to '/'
  end
  private
  def user_params
  	params.require(:user).permit(:first, :last, :email, :address, :city, :state, :password, :password_confirmation, :position_id).merge(admin: false)
  end
  def user_up
    params.require(:user).permit(:first, :last, :email, :address, :city, :state, :position_id, :admin)
  end
  def set_user
    @user = User.find_by(id: params[:id])
  end
end
