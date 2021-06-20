class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.integer :employee_id
      t.integer :pet_id
      t.string :city
      t.string :name
    end
  end
end
