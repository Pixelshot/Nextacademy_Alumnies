class AdminController < ApplicationController

before_action :check_admin?

	def index
		@user = User.all
		@newstable = Newstable.all
	end

	def update
	end

	def reset
		rand = (0...8).map { (65 + rand(26)).chr }.join
		# byebug
		@user = User.find(params[:id])
		@user.update(password: rand, password_confirmation: rand)
		PasswordsJob.perform_later(@user.id, rand)
		# NotifyMailer.password_reset_email(@user, rand).deliver_now
		redirect_to admin_path
		flash[:success] = "Password has been reseted and notification email sent"
	end

	private

	def check_admin?
		unless User.find(session[:user_id]).admin == 1		
			redirect_to root_path
			flash[:warning] = "Access Denied"
		end
	end


end