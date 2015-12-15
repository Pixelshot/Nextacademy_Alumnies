class AccountCreateJob < ActiveJob::Base
  queue_as :default

  def perform(user_id, password)
    @user = User.find(user_id)
    @password = password
    NotifyMailer.account_create_email(@user, @password).deliver_now
  end

end