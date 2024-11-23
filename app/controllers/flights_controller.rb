  class FlightsController < ApplicationController
    def index
      airports = Airport.order(:code).all.map { |airport| [ airport.code, airport.id ] }
      @departure_airport_options = airports
      @arrival_airport_options = airports

      @start_dates = Flight.upcoming.pluck(:start_date).map { |date| [ date.strftime("%B %d, %Y"), date ] }.uniq

      @passenger_numbers = (1..9).to_a

      if search_params.present?
        @flights = Flight.includes(:departure_airport, :arrival_airport)
                         .where("departure_airport_id = ? AND arrival_airport_id = ? AND start_date >= ?",
                                params[:search][:departure_airport_id], params[:search][:arrival_airport_id],
                                params[:search][:start_date])
        @passenger_number = params[:search][:passenger_number]
      end
    end

    private

    def search_params
      params.fetch("search", {}).permit(:departure_airport_id, :arrival_airport_id, :start_date, :passenger_number)
    end
  end
