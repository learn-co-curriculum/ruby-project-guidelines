class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.datetime :departure
      t.float :price
    end
  end
end
