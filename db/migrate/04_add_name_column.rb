class AddNameColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurant_menu_items, :item_name, :string
  end
end
