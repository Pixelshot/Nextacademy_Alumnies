class PasswordsJob < ActiveJob::Base
queue_as :default

  def perform(user_id, rand)
    @user = User.find(user_id)
    NotifyMailer.password_reset_email(@user, rand).deliver_now
  end

end
