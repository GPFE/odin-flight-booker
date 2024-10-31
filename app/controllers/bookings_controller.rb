class BookingsController < ApplicationController
  def new
    @flight = Flight.includes(:departure_airport, :arrival_airport).find(params[:flight_id])
    @departure_airport_id = @flight.departure_airport_id
    @arrival_airport_id = @flight.arrival_airport_id

    @booking = Booking.new
    @number_of_passengers = params[:number_of_passengers].to_i
    @number_of_passengers.times do
      passenger = @booking.passengers.build
    end
  end

  def create
    puts params.inspect
    p params[:booking][:flight_id]
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.new(booking_params)
    # @booking.passengers.build(params[:booking][:passenger_attributes][:id][:name, :email])
    # @booking.passengers.build(params[:id][:name], params[:id][:email])
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
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end
