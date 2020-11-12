class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|

      t.string :name 
      t.string :breed
      t.string :energy_level 
      t.integer :age 
      t.string :hypoaller 
      t.string :sex 
      t.integer :weight 
    end  
  end
end
