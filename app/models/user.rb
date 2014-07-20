require "bcrypt"
class User < ActiveRecord::Base
	has_many :patrons
	has_many :beers
	has_many :notifications

	before_save { self.email = email.downcase }
	validates :bar_name, presence: true, length: { maximum: 100 }
	validates :username, presence: true, length: { maximum: 20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
  									format: { with: VALID_EMAIL_REGEX },
  									uniqueness: { case_sensitive: false },
  									confirmation: true
  has_secure_password
  validates :password, length: { minimum: 6 }
end
