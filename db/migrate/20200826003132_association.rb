class Association < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :passenger_id, :bigint
    add_column :bookings, :flight_id, :bigint
  end
end
