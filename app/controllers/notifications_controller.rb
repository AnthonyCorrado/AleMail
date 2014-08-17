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
    @patrons = Patron.all
    @patrons = @patrons.where(beer_id: @notification.beer_id)
    text_updates(@patrons, @notification.message_content)
    # text_updates(@notification)
  	if @notification.save
  		redirect_to user_path(current_user)
  	else
  		render 'new'
  	end
  end

  def text_updates(patrons, message_content)
    @client = Twilio::REST::Client.new ENV['TWILIO_ID'], ENV['TWILIO_SECRET']
    patrons.each do |p|
      if p.phone != "" 
        @client.account.messages.create({
          :from => ENV['TWILIO_PHONE'], 
          :to => "#{p.phone}",
          :body => "Message: #{message_content}"
          })
        puts p.phone
      end
    end
    puts message_content
    puts "chicken yoshi matt"
  end

  private

  def notification_params
  	params.require(:notification).permit(:user_id, :beer_id, :patron_id, :message_content)
  end 
end
