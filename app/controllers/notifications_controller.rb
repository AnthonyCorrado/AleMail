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
    @user = User.find(current_user).bar_name
    @beer = Beer.find(@notification.beer_id).name
  	if @notification.save
      text_updates(@patrons, @user, @beer, @notification.message_content)
      @patrons.each do |p|
        UserMailer.notification_email(p, @user, @beer, @notification.message_content)
      end
  		redirect_to user_path(current_user)
  	else
  		render 'new'
  	end
  end

  def text_updates(patrons, bar, beer, message_content)
    @client = Twilio::REST::Client.new ENV['TWILIO_ID'], ENV['TWILIO_SECRET']
    patrons.each do |p|
      if p.phone != "" 
        @client.account.messages.create({
          :from => ENV['TWILIO_PHONE'], 
          :to => "#{p.phone}",
          :body => "Greetings from #{bar}! #{beer} is back in stock. #{message_content}"
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
