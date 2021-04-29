class User < ApplicationRecord
	has_secure_password
	has_many :event_users
	has_many :events, through: :event_users

	validates :email, presence: true, uniqueness: true
end
