class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :menu_item_id
      t.integer :restaurant_id
      t.integer :restaurant_menu_item_id
      t.timestamps
    end
  end
end
