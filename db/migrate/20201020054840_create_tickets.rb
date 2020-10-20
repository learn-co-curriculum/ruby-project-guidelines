class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :passenger_id
      t.integer :flight_id
      t.float :price
      t.string :seat_class
      t.string :seat_num
    end
  end
end
