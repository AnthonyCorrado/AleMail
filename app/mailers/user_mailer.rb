class UserMailer < ActionMailer::Base
  default from: "alemailapp@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://yahoo.com'
  	mail(to: @user.email, subject: 'Welcome to Ale Mail')
  end

  def notification_email(patron, user, beer, message_content)
  	@patron = patron
  	@user = user
  	@beer = beer
  	@message_content = message_content
  		mail(to: @patron.email, subject: "Your beer is back at #{@user}!").deliver
  end

  # def sort_patrons_emailer(patrons, user, beer, message_content)
  # 	@patrons = patrons
  # 	@patrons.each do |p|
  # 		notification_email(p, user, beer, message_content)
  # 	end
  # end

end