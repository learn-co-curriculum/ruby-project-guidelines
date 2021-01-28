class CreateInventory < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do
      |t|
      t.references :store
      t.references :item
      t.float :price
      t.integer :quantity
      t.timestamps
    end
  end
end
