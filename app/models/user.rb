class User < ActiveRecord::Base

	validates :username, presence: true
	validates :login_email, uniqueness: true
	
	has_many :newstables, dependent: :destroy
	has_many :testimonials, dependent: :destroy

	has_secure_password

end
