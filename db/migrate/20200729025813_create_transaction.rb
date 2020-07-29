class CreateTransaction < ActiveRecord::Migration[6.0]
  def change
    create_table :mytransactions do |t|
      t.integer :cart_id
      t.integer :total_amount
    end
  end
end
