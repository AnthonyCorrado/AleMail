class BeersController < ApplicationController

  def index
  	@user = User.find(current_user)
    @beers = @user.beers
  end

  def new
  	@beers = Beer.new
  end

  def create
  	@beers = Beer.new(beer_params)
  	if @beers.save
  		redirect_to user_path(current_user)
  	else
  		render 'new'
  	end
  end

  def beer_params
  	params.require(:beer).permit(:name, :brewery, :style, :comments, :brewery_location)
  end
end

