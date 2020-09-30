class DeleteRestaurantMenuItemItemName < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurant_menu_items, :item_name
  end
end
