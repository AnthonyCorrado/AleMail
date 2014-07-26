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

  def edit
    @patron = Patron.find(params[:id])
  end

  def update
    @patron = Patron.find(params[:id])
    if @patron.update(patron_params)
      redirect_to url_for(:controller => :users, :action => :patron_list)
    else
      render 'edit'
    end
  end

  def patron_params
    params.require(:patron).permit(:last_name, :first_name, :phone, :email, :user_id)
  end
end
