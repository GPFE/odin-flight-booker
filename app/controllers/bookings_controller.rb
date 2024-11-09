class BookingsController < ApplicationController
  def new
    @flight = Flight.includes(:departure_airport, :arrival_airport).find(params[:flight_id])
    @departure_airport_id = @flight.departure_airport_id
    @arrival_airport_id = @flight.arrival_airport_id
    @number_of_passengers = params[:number_of_passengers].to_i

    @booking = Booking.new
    @booking.passengers.build
  end

  def create
    puts params.inspect
    p params[:booking][:flight_id]
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.new(booking_params)

    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      puts @booking.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
