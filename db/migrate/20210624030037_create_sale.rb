class CreateSale < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.integer :employee_id
      t.integer :product_id
      t.integer :customer_id
    end
  end
end
