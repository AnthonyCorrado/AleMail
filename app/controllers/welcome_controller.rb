class WelcomeController < ApplicationController
  def index
  	@username = User.find(current_user)
  end
end
