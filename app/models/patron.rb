class Patron < ActiveRecord::Base
	belongs_to :user
	has_many :my_beer_lists
	has_many :notifications
	has_many :beers

	validates_length_of :phone, :is => 10, allow_nil: true, allow_blank: true
	validates_format_of :email, with: /[a-zA-Z0-9]\@[a-zA-Z]{2,}\.[a-zA-Z]{2,}/, allow_nil: true, allow_blank: true
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, unless: ->(user){user.phone.present?}
  # validates :phone, presence: true, unless: ->(user){user.email.present?}
	
	before_save { self.email = email.downcase }
	before_save { self.first_name = first_name.titleize }
	before_save { self.last_name = last_name.titleize }

  
end
