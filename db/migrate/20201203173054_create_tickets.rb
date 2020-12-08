class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :event_id
    end
  end
end
