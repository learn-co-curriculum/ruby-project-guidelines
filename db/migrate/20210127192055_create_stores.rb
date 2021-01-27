class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do
      |store|
      store.string :name
      store.string :address
      store.timestamps
    end
  end
end
