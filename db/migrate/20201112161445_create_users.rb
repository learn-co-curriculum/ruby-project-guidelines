class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
  
      t.string :name 
      t.string :allergy 
      t.string :location 
      t.string :life_style
      
      t.timestamps 
    end 
  end
end
