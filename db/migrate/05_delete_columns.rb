class DeleteColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :menu_item_id
    remove_column :menu_items, :restaurant_id
  end 
end
