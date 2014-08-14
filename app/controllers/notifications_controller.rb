class NotificationsController < ApplicationController
  def index
  	@user = User.find(current_user)
  	@notifications = @user.notifications
  end

  def show
  	@notifcation = Notification.find(params[:id])
  end

  def new
    @notification = Notification.new
  	@user = User.find(current_user)
    @beer = @user.beers
  end

  def create
  	@notification = Notification.new(notification_params)
  	if @notification.save
  		redirect_to user_path(current_user)
  	else
  		render 'new'
  	end
  end

  private

  def notification_params
  	params.require(:notification).permit(:user_id, :beer_id, :patron_id, :message_content)
  end
  
end
