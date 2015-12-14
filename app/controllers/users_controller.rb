class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def index
    @mentors = User.where(admin: 1)
    @students = User.where(admin: 0)
  end

  def show
    @user = User.find(params[:id])
    @user_testimonials = Testimonial.where(user_id: @user.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :contact_email, :login_email, :password, :fb, :linkedin, :twitter, :github, :batch_month, :batch_year, :projects_link, :description, :avatar, :status, :slack_id, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end