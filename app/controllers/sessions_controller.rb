class SessionsController < ApplicationController
  def new
  end

  def create
  	# Get password from params
  	email = params[:session][:email]
  	password = params[:session][:password]
  	# User.find_by(email: params["email"]) from DB using email from params
  	@user = User.find_by(email: email)
  	# compare password from params with password_digest from DB
  	if @user.present? and @user.authenticate(password)
  		reset_session
  	 	session[:user_id] = @user.id
  	 	flash[:session] = "Welcome back #{@user.email}."
	  	redirect_to root_path
  	else 
  		flash[:error] = "oops, try again"
  		render :new
  	end
  end

  def destroy 
  # to log out
    reset_session
    flash[:success] = "See you soon"
    redirect_to root_path

  end



end
