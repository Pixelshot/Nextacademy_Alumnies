class NotifyMailer < ApplicationMailer

  def news_email(newstable)
    @newstables = newstable
    @sender = Newstable.find(newstable.id).user.username
    all_emails = User.all.collect(&:login_email).join(",")
      mail(to: all_emails, subject: "There are new update of newsfeed from '#{@sender}' ")
  end

  def password_reset_email(user, password)
    @user = user
    @password = password
    mail(to: @user.login_email, subject: "Password reset for Next-Academy Alumnies Website")
  end

  def account_create_email(user, password)
    @user = user
    @password = password
    mail(to: @user.login_email, subject: "Account has been created for Next-Academy Alumnies")
  end
end
