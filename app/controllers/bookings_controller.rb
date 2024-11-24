class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @passengers_number = params[:passengers_number].to_i
    @booking = @flight.bookings.new
    @passengers_number.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.build(booking_params)

    if @booking.save
      flash[:success] = "Flight Booked Successfully"
      redirect_to booking_path(@booking)
    else
      puts @booking.errors.full_messages # Booking errors
      @booking.passengers.each { |p| puts p.errors.full_messages } # Passenger errors
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passengers_number, passengers_attributes: [ :name, :email ])
  end
end
