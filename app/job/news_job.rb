class NewsJob < ActiveJob::Base
	queue_as :default

	def perform(newstable_id)
		@newstable = Newstable.find(newstable_id)
		NotifyMailer.news_email(@newstable).deliver_now
	end

end