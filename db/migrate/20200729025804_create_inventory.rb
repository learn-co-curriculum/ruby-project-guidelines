class CreateInventory < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :item_id
      t.integer :stocks
    end
  end
end
