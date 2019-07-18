class User < ApplicationRecord
	has_many :recipes
	has_many :messages
	has_secure_password
  validates :email, presence: true, uniqueness: true
end
