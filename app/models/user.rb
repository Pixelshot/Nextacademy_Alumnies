class User < ActiveRecord::Base

	validates :username, presence: true
	validates :login_email, uniqueness: true
	validates :batch_month, presence: true
	validates :batch_year, presence: true
	
	has_many :newstables, dependent: :destroy
	has_many :testimonials, dependent: :destroy

	has_secure_password

end
