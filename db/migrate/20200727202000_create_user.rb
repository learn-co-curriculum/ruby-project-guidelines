class CreateUser < ActiveRecord::Migration[6.0]
  def change 
    create_table :users do |t|
      t.string :name
      t.integer :review_id
    end
  end
end
