class NotifyMailer < ApplicationMailer

	def news_email(newstable)
		@newstables = newstable
		@sender = Newstable.find(newstable.id).user.username
		all_emails = User.all.collect(&:login_email).join(",")
			mail(to: all_emails, subject: "There are new update of newsfeed from '#{@sender}' ")
	end
end
