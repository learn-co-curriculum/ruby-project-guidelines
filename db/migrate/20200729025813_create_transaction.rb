class CreateTransaction < ActiveRecord::Migration[6.0]
  def change
    create_table :mytransactions do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :cart_id
    end
  end
end
