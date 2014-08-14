class PatronsController < ApplicationController
  def index
  	@user = User.find(current_user)
    @patrons = @user.patrons
  end

  def show
  	@patron = Patron.find(params[:id])
  end

  def new
  	@patron = Patron.new
    @user = User.find(current_user)
    @my_beer_list = MyBeerList.new
    @beer = @user.beers
  end

  def create
    # @my_beer_list = MyBeerList.new(my_beer_lists_params)
    @patron = Patron.new(patron_params)
    @my_beer_list = @patron.my_beer_lists
    if @patron.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @patron = Patron.find(params[:id])
    @beer = @patron.beers
  end

  def update
    @patron = Patron.find(params[:id])
    if @patron.update(patron_params)
      redirect_to url_for(:controller => :users, :action => :patron_list)
    else
      render 'edit'
    end
  end

  #  def new
  #   @my_beer_list = MyBeerList.new
  #   @patron = User.find(current_user.patrons)
  # end

  # def create
  #   @my_beer_list = MyBeerList.new(my_beer_lists_params)
  #   if @my_beer_list.save
  #     redirect_to user_path(current_user)
  #   else
  #     render 'new'
  #   end
  # end


  private


  def patron_params
    params.require(:patron).permit(:last_name, :first_name, :phone, :email, :user_id, :beer_id, :beer_id_two, :beer_id_three)
  end

  def my_beer_lists_params
    params.require(:my_beer_list).permit(:patron_id, :beer_id,)
  end
end
