class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :nickname
      t.string :species
      t.float :weight
      t.integer :age
      t.boolean :alive
      t.integer :years_in_captivity
      t.float :price
    end
  end
end
