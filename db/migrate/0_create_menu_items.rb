class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.integer :restaurant_id #can use belong_to 
    end
  end
end
