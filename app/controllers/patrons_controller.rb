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
  	@patron = Patron.new(patron_params)
  	  if @patron.save
        redirect_to user_path(current_user)
      else
        render 'new'
      end
  end

  def patron_params
    params.require(:patron).permit(:last_name, :first_name, :phone, :email)
  end
end
