class Airport < ApplicationRecord
  has_many :airport_flights
  has_many :flights, through: :airport_flights

  # Optional associations to link with `Flight` directly
  has_many :departing_flights, class_name: 'Flight', foreign_key: 'departure_airport_id'
  has_many :arriving_flights, class_name: 'Flight', foreign_key: 'arrival_airport_id'
end