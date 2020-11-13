require 'pry'
require 'rainbow'

class CLI 

    attr_reader :playlist

    def greet
        prompt = TTY::Prompt.new
        option = prompt.select("WHAT'S YOUR MOOD?".magenta, %w(Happy Chill Sad))
        
        user_option(option)

        #save playlist
        #view random song 

    end 

    def user_option(option)

        # new_playlist_happy = []
        # new_playlist_sad = []
        # new_playlist_chill = []



        if option == "Happy"
            puts "YOUR HAPPY LOFI PLAYLIST".yellow.blink
            new_playlist = Song.where(mood: "Happy").sample(10) 
            new_playlist.each do |song_instance|
                puts "#{song_instance.song_name}, #{song_instance.url.yellow}"

                
            end
            save_playlist(new_playlist)
                
        elsif option == "Sad"
            puts "YOUR SAD LOFI PLAYLIST".blue.blink
            new_playlist = Song.where(mood: "Sad").sample(10) 
            new_playlist.each do |song_instance|
                puts "#{song_instance.song_name}, #{song_instance.url.blue}"
                
            end
            save_playlist(new_playlist)

        elsif option == "Chill" 
            puts "YOUR CHILL LOFI PLAYLIST".green.blink
            new_playlist = Song.where(mood: "Chill").sample(10) 
            new_playlist.each do |song_instance|
                puts "#{song_instance.song_name}, #{song_instance.url.green}"
             end
             save_playlist(new_playlist)
        end



    end

    def save_playlist(song_list)
        prompt = TTY::Prompt.new
        save_playlist = prompt.select("DO YOU WANT TO SAVE YOUR PLAYLIST?".magenta, %w(YES NO))
            if save_playlist == "YES"
                prompt = TTY::Prompt.new
                user_response = prompt.ask("WHAT DO YOU WANT TO CALL YOUR PLAYLIST?")
                new_playlist_instance = Playlist.create(playlist_name: user_response)
                @playlist = song_list.each do |song|
                    PlaylistSong.create(playlist_id: new_playlist_instance.id, song_id: song.id)
                end
                puts "PLAYLIST #{user_response} SAVED".red
                playlist_options
                
            else 
                CLI.new.greet 
            end
        end
        
        def playlist_options
            
            
            prompt = TTY::Prompt.new
        other_functions = prompt.select("WHAT DO YOU WANT TO DO WITH YOUR PLAYLIST?".magenta, %w(Add\ A\ Song Generate\ New\ Playlist))

        if other_functions == "Add A Song"
            binding.pry
            Song.all.select do |new_song|
                new_added_song = new_song.where(mood: "Happy").sample(1) 
                @playlist << new_added_song

                if new_added_song == new_song.where(mood: "Chill").sample(1)
                    @playlist << new_added_song
                end
            end
            #itterates through Song.all and grabs new song and inserts into current playlist
            #new song added prompt
            #displays new playlist 
            #back to functions prompt 

        elsif other_functions == "Generate New Playlist"
            Playlist.last.destroy
            CLI.new.greet

        end


    

    end
end


