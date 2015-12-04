class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  def authenticate_user!
  	if user_logged_in?
  	else
  		redirect_to login_path
  		flash[:warning] = "please login"
  	end
  end

end
