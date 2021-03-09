class CreateTanks < ActiveRecord::Migration[5.2]

    def change
        create_table :tanks do |t|
            t.string :name
            t.integer :fish_limit
        end
    end
end