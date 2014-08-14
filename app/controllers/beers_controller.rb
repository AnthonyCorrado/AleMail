class BeersController < ApplicationController
  def index
  	@user = User.find(current_user)
    @beers = @user.beers
  end

  def new
  	@beer = Beer.new
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
  		redirect_to url_for(:controller => :users, :action => :beer_list)
  	else
  		render 'edit'
  	end
  end

  def beer_params
  	params.require(:beer).permit(:name, :brewery, :style, :comments, :brewery_location, :user_id, :patron_id)
  end
end