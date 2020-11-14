require 'pry'
require 'rainbow'

class CLI 

    attr_reader :playlist, :user_mood


   def welcome 
    system ("clear")

puts render_ascii_art

   puts "WELCOME TO LOFI MOOD APP"


   greet

   end

   def render_ascii_art
    File.readlines("lib/welcome.txt") do |line|
      puts line
    end
  end


    def greet


        prompt = TTY::Prompt.new
        @user_mood = prompt.select("WHAT'S YOUR MOOD?".magenta, %w(Happy Chill Sad))
        
        user_option(@user_mood)

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
                @playlist = Playlist.create(playlist_name: user_response)
                song_list.each do |song|
                    PlaylistSong.create(playlist_id: @playlist.id, song_id: song.id)
                end
                system ("clear")
                puts "PLAYLIST #{user_response} SAVED".red
                playlist_options
                
            else 
                system ("clear")
                CLI.new.greet 
            end
        end
        
        def playlist_options
            
            
            prompt = TTY::Prompt.new
        other_functions = prompt.select("WHAT DO YOU WANT TO DO WITH YOUR PLAYLIST?".magenta, %w(Add\ A\ Song Generate\ New\ Playlist Exit))

        if other_functions == "Add A Song"
            new_added_song = Song.where(mood: @user_mood).sample(1)
                
                eleven_song_playlist = @playlist.songs << new_added_song
            
                puts "NEW SONG HAS BEEN ADDED".red
                eleven_song_playlist.each do |song|
                    puts "#{song.song_name}, #{song.url.blue}"
                end
                playlist_options
    
    
            #itterates through Song.all 
            #grabs a random song and inserts into current playlist
            #new song added prompt
            #displays new playlist 
            #back to functions prompt 

        elsif other_functions == "Generate New Playlist"
            Playlist.last.destroy
            system ("clear")
            CLI.new.greet

        elsif other_functions == "Exit"
            exit

        end

    

    end
    #EXIT METHOD#

end


