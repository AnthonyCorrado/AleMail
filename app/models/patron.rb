class Patron < ActiveRecord::Base
	belongs_to :user
	has_many :my_beer_lists
	has_many :notifications

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, unless: ->(user){user.phone.present?}
  validates :phone, presence: true, unless: ->(user){user.email.present?}
	
	before_save { self.email = email.downcase }

  
end
