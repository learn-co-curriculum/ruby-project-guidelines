class CreateInventory < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do
      |inventory|
      inventory.references :user
      inventory.references :item
      inventory.float :price
      inventory.integer :quantity
      inventory.timestamps
    end
  end
end
