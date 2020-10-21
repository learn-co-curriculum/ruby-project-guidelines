class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.date :departure
      t.integer :carrier_id
    end
  end
end
