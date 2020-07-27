class CreateItem < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :cost
      t.string :description
      t.integer :review_id
    end
  end
end
