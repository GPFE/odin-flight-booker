class Booking < ApplicationRecord
  has_many :passengers
  belongs_to :flight
  accepts_nested_attributes_for :passengers, reject_if: ->(a) { a[:name].blank? ||  a[:email].blank? }
end
