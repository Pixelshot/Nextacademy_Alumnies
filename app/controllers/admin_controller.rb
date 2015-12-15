class AdminController < ApplicationController

before_action :check_admin?

  def new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_path
  end


  def edit
    @user = User.find(params[:id])
  end

  def createuser
    rand = (0...8).map { (65 + rand(26)).chr }.join
    @user = User.new(user_params.merge(username: user_params[:login_email]))
    @user.password = rand
    if @user.save
      AccountCreateJob.perform_later(@user.id, rand)
      redirect_to admin_path
      flash[:success] = "Account has successfully created!"
    else
      render :new
      flash[:warning] = "Account not created!"
    end

  end


  def index
    @user = User.all
  end

  def filter
    batch_year = filter_params[:batch_year]
    batch_month = filter_params[:batch_month]
    username = filter_params[:username]

    @user = User.all

    @user = @user.where(batch_year: batch_year) unless batch_year.empty?
    @user = @user.where(batch_month: batch_month) unless batch_month.empty?
    @user = @user.where("username LIKE ?", "%#{username}%") unless username.empty?
    render "/admin/index"
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

  def delete
    @user = User.find(params[:id])
    @user.delete
    redirect_to admin_path
  end

  private

  def filter_params
    params.require(:filter).permit(:batch_year, :batch_month, :username)
  end

  def user_params
    params.require(:user).permit(:login_email, :batch_year, :batch_month)
  end


end