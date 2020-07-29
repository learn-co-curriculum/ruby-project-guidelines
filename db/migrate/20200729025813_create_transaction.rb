class CreateTransaction < ActiveRecord::Migration[6.0]
  def change
    create_table :mytransactions do |t|
      t.integer :item_id
      t.integer :user_id
    end
  end
end
