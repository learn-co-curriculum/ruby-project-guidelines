class CreatePurchase < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do
      |t|
      t.references :item
      t.references :customer
      t.timestamps
    end
  end
end
