class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :food_id
      t.integer :quantity
      t.integer :total
      t.timestamp 

    end 
    
  end
end
