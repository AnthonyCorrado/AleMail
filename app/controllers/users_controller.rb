class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]
	before_action :correct_user, only: [:edit, :update]

	def index
		@users = User.all

	end

	def show
		@user = User.find(params[:id])
		@patrons = Patron.all
		patron_list
	end

	def patron_list
		@user = current_user
		@patrons = @user.patrons
		@patrons = @patrons.order("first_name ASC")
	end

	def beer_list
		@user = current_user
		@beers = @user.beers
		@beers = @beers.order("id DESC")	
	end

	def notification_list
		@user = current_user
		@notifications = @user.notifications
		@notifications = @notifications.order("id DESC")
		@beers = Beer.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Ale Mail!"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def edit
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

  private

		def user_params
			params.require(:user).permit(:bar_name, :username, :password, :password_confirmation, :phone, :address, :email)
		end

		# Before filters

		def signed_in_user
			unless signed_in?
				store_location
				redirect_to signin_url, notice: "Please sign in."
			end
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end
end