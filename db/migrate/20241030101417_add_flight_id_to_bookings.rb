class AddFlightIdToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :flight_id, :integer
  end
end
