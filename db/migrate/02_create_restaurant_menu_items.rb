class CreateRestaurantMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_menu_items do |t|
      t.integer :menu_item_id
      t.integer :restaurant_id
    end
  end
end
