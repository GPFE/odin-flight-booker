class FlightsController < ApplicationController
  def index
    @flight = Flight.new

    @possible_flights = Flight.all.includes(:departure_airport, :arrival_airport).where("departure_airport_id == ?", params[:departure_airport_id]).where("arrival_airport_id == ?", params[:arrival_airport_id])
  end

  def new
    
  end

  private

  def get_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :number_of_passengers, :start_datetime)
  end
end
