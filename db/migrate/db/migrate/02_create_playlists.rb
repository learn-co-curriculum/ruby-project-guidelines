class CreatePlaylists < ActiveRecord::Migration[4.2]
    def change
        create_table :playlists do |t|
            t.string :playlist_name
        end
    end 
end
