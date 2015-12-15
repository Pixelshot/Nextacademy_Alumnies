module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_logged_in?
    current_user.present?
  end

    def check_admin?
    unless User.find(session[:user_id]).role == 2   
      redirect_to root_path
      flash[:warning] = "Access Denied"
    end
  end

end
