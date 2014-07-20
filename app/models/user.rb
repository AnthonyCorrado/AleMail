require "bcrypt"
class User < ActiveRecord::Base
	has_secure_password

	has_many :patrons
	has_many :beers
	has_many :notifications
end
