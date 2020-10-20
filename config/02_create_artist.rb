class CreateArtist < ActiveRecord::Migration[4.2]

    def change
        create_table :artists do |t|
            t.string :name 
        end
    end

end