class CreateConcert < ActiveRecord::Migration[4.2]

    def change 
        create_table :concerts do |t|
            t.string :title
            t.string :city
            t.string :venue
            t.date :date
        end
    end

end