class DeleteRestaurantMenuItemName < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurant_menu_items, :name
  end
end
