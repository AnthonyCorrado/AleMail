class MyBeerListsController < ApplicationController
  def index
  	@patron = Patron.find(37)
  	@my_beer_lists = @patron.my_beer_lists
  end

  def show
  	@my_beer_list = MyBeerList.find(params[:id])
  end

  def create
  	@my_beer_list = MyBeerList.new(my_beer_lists_params)
  	if @my_beer_list.save
  		redirect_to user_path(current_user)
    else
      render 'new'
   	end
  end

  def edit
  	@my_beer_lists = MyBeerList.find(params[:id])
  end

  private

  def my_beer_lists_params
    params.require(:my_beer_list).permit(:patron_id, :beer_id,)
  end

end
