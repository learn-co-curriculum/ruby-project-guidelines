class CreateFish < ActiveRecord::Migration[5.2]

    def change 
        create_table :fish do |t|
            t.string :name
            t.string :type
            t.string :size
            t.integer :tank_id
        end
    end

end