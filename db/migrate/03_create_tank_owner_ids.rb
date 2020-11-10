class CreateTankOwnerIds < ActiveRecord::Migration[5.2]

    def change
        create_table :tank_owner_ids do |t|
            t.integer :owner_id
            t.integer :tank_id    
        end
    end

end