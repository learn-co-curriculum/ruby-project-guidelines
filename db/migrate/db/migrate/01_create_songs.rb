class CreateSongs < ActiveRecord::Migration[4.2]
    def change
        create_table :songs do |t|
            t.string :song_name
            t.string :url 
            t.string :mood
        end
    end 
end
