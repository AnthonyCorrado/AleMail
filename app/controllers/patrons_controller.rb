class PatronsController < ApplicationController
  def index
  	@patrons = Patron.all
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
