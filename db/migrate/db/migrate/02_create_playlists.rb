class CreatePlaylists < ActiveRecord::Migration[4.2]
    def change
        create_table :playlist do |t|
            t.string :playlist_name
        end
    end 
end
