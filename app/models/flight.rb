class Flight < ApplicationRecord
  has_many :airport_flights
  has_many :airports, through: :airport_flights

  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: :arrival_airport_id
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: :departure_airport_id
end
