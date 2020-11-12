class CreateCompatabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :compatabilities do |t|
      
      t.string :allergies
      t.string :energy_level 
      t.string :life_style 
      t.integer :weight 
    end 
  end
end
