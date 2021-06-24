class CreateProduct < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :store_id
      t.string :name
      t.float :price
    end
  end
end
