class Beer < ActiveRecord::Base
	belongs_to :user
	has_many :my_beer_lists
	has_many :notifications

	before_save { self.name = name.titleize }
	before_save	{ self.brewery = brewery.titleize }
	before_save { self.style = style.titleize }
	before_save	{ self.brewery_location = brewery_location.titleize }
end
