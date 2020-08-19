class Associations < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :from_airport_id, :bigint
    add_column :flights, :to_airport_id, :bigint
  end
end
