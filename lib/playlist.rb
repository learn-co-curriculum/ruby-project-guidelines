class Playlist < ActiveRecord::Base
    has_many :playlist_songs
    has_many :songs, through: :playlist_songs

    def create_playlist
        Song.select.sample do |songs|
            new_playlist = Playlist.create(Song.where(mood: self).sort(() => 0.5 - Math.random()).slice(0,10))
            puts new_playlist 
        end
    end
end