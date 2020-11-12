require 'pry'
require 'rainbow'

class CLI 

    def greet
        prompt = TTY::Prompt.new
        option = prompt.select("WHAT'S YOUR MOOD?".magenta, %w(Happy Chill Sad))
        
        user_option(option)
    end 

    def user_option(option)

        new_playlist = []

        if option == "Happy"
            puts "YOUR HAPPY LOFI PLAYLIST".yellow.blink
                new_playlist << Song.where(mood: "Happy").sample(10) 
                new_playlist.each do |song_instance|
                    song_instance.each do |s|
                        puts "#{s.song_name}, #{s.url.yellow}"
                    end
            
             end
                

        elsif option == "Sad"
            puts "YOUR SAD LOFI PLAYLIST".blue.blink
                new_playlist << Song.where(mood: "Sad").sample(10) 
                new_playlist.each do |song_instance|
                    song_instance.each do |s|
                        puts "#{s.song_name}, #{s.url.blue}"
                    end
             end

        else option == "Chill" 
            puts "YOUR CHILL LOFI PLAYLIST".green.blink
                new_playlist << Song.where(mood: "Chill").sample(10)  
                new_playlist.each do |song_instance|
                    song_instance.each do |s|
                        puts "#{s.song_name}, #{s.url.green}"
                    end
             end
        end
    end
end