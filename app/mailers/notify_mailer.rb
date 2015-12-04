class NotifyMailer < ApplicationMailer

	def news_email(newstable)
		@sender = Newstable.find(newstable.id).user.contact_email
		User.all.each do |t|
			@receiver = t.login_email
			mail(to: @receiver, subject: "There are new update of newsfeed from '#{@sender}' ")
		end
	end
end
