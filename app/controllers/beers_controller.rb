class BeersController < ApplicationController
  def index
  	@user = User.find(current_user)
    @beers = @user.beers
  end

  def new
  	@beers = Beer.new
  end

  def create
  	@beer = Beer.new(beer_params)
  	if @beer.save
  		redirect_to user_path(current_user)
  	else
  		render 'new'
  	end
  end

  def edit
  	@beer = Beer.find(params[:id])
  end

  def update
  	@beer = Beer.find(params[:id])
  	if @beer.update(beer_params)
  		redirect_to user_path(current_user)
  	else
  		render 'edit'
  	end
  end

  def beer_params
  	params.require(:beer).permit(:name, :brewery, :style, :comments, :brewery_location)
  end
end