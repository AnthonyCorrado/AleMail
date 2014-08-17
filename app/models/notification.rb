class Notification < ActiveRecord::Base
	belongs_to :user
	belongs_to :beer
	belongs_to :patron

	validates :beer_id, presence: true

end
