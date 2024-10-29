# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
    "IST",
    "LHR",
    "CDG",
    "AMS",
    "MAD",
    "FRA",
    "BCN",
    "LGW",
    "MUC",
    "FCO"
].each do |airport|
  Airport.find_or_create_by!(code: airport)
end

[
  [1, 10, 2],
  [2, 4, 5],
  [3, 9, 4],
  [6, 8, 5],
  [5, 7, 8],
  [4, 6, 4],
  [8, 10, 1],
  [9, 3, 7],
  [7, 2, 3],
  [6, 4, 1],
  [1, 5, 2],
  [2, 9, 4],
  [3, 6, 6],
  [5, 8, 2],
  [7, 1, 3]
]
.each do |departure_airport, arrival_airport, duration|
  Flight.find_or_create_by!(departure_airport_id: departure_airport, arrival_airport_id: arrival_airport, duration: duration)
end
