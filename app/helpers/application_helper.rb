module ApplicationHelper

	def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	def user_logged_in?
		current_user.present?
	end

	def user_admin?
		current_user.admin == 1
	end
end
