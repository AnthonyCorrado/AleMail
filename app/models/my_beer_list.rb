class MyBeerList < ActiveRecord::Base
	belongs_to :patron
	belongs_to :beer
	belongs_to :user

end
