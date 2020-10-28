class CitiesController < ApplicationController

  def new 
  end

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @loufoc = @city.users
  end
end
