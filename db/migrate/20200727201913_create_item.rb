class CreateItem < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :cost
      t.string :description
    end
  end
end
