class FlightsController < ApplicationController
  def index
    flights = Flight.upcoming

    @departure_airport_options = flights.map { |flight| [ flight.departure_airport.code, flight.departure_airport.id ] }.uniq
    @arrival_airport_options = flights.map { |flight| [ flight.arrival_airport.code, flight.arrival_airport.id ] }.uniq

    @start_dates = flights.pluck(:start_date).map { |date| [ date.strftime("%B %d, %Y"), date ] }.uniq

    @passenger_numbers = (1..9).to_a
  end
end
