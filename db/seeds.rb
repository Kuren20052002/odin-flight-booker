# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
airport_codes = [ "SFO", "NYC", "LAX", "ORD", "ATL", "DFW", "JFK", "SEA", "MIA", "DEN" ]
airport_codes.each do |code|
  Airport.find_or_create_by(code: code)
end

flight_data = [
  { departure_airport_id: 1, arrival_airport_id: 3, start_date: "31-12-2024", duration: 231 },
  { departure_airport_id: 2, arrival_airport_id: 4, start_date: "15-01-2025", duration: 180 },
  { departure_airport_id: 3, arrival_airport_id: 5, start_date: "20-02-2025", duration: 300 },
  { departure_airport_id: 4, arrival_airport_id: 1, start_date: "10-03-2025", duration: 150 },
  { departure_airport_id: 5, arrival_airport_id: 2, start_date: "25-04-2025", duration: 210 }
]
flight_data.each do |flight|
  Flight.find_or_create_by(flight)
end
