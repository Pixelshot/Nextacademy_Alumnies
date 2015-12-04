class Newstable < ActiveRecord::Base
	validates :title, presence: :true
	validates :body, presence: :true	

	belongs_to :user
	mount_uploaders :images, ImageUploader
end
