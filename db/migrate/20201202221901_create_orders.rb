class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :food_id
      t.integer :quantity
      t.integer :total

      t.timestamps

    end 
    
  end
end
