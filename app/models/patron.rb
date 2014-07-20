class Patron < ActiveRecord::Base
	belongs_to :user
	has_many :my_beer_lists
	has_many :notifications
end
