class CreateTicketpurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :ticketpurchases do |t|
      t.integer :guest_id
      t.string :viewing_room
      t.integer :movie_id
      t.integer :showtime 
      t.integer :ticket_price
    end
  end
end
