class SessionsController < ApplicationController
before_action :authenticate_user!, only: []

def new
end

def create
	if @user = User.find_by(login_email: params[:session][:email])
		@user && @user.authenticate(params[:session][:password])
		session[:user_id] = @user.id
		redirect_to root_path
		flash[:Successful] = "login Successful"
	else
		redirect_to login_path
		flash[:Warning] = "Invalid Username or password"
	end

end

def destroy
  session[:user_id] = nil
  redirect_to root_path
  flash[:Successful] = "User logged out"
end

end