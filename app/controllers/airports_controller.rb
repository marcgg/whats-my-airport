class AirportsController < ApplicationController
  layout "admin"

  before_filter :check_session

  def index
    @airports = Airport.all(:order => "code asc")
  end

  def show
    @airport = Airport.find_by_code(params[:id])
  end

  def update
    airport = Airport.find_by_code(params[:id])
    airport.update_attributes! params[:airport]
    redirect_to airport_path(code: airport.code)
  end

end
