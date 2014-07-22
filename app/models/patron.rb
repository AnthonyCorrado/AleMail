class Patron < ActiveRecord::Base
	belongs_to :user
	has_many :my_beer_lists
	has_many :notifications

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  before_save { self.email = email.downcase }
end
