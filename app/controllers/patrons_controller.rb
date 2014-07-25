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
  end

  def create
  	@patron = 
  	@patron.save
  end
end
