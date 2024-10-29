class CreateAirportFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :airport_flights do |t|
      t.integer :airport_id
      t.integer :flight_id

      t.timestamps
    end
  end
end
