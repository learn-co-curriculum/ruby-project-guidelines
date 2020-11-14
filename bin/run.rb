require_relative '../config/environment'
require 'rainbow'
require "tty-prompt"

#pid = fork{ exec 'afplay', "../Desktop/OSTIN - STIMMT.mp3" }

# def greet
#     prompt = TTY::Prompt.new
#     prompt.select("WHAT'S YOUR MOOD?", %w(Happy Chill Sad))
# end
CLI.new.welcome
#CLI.new.greet


# def user_option
#     option = gets
#         if option == Happy
#             puts "YOUR HAPPY LOFI PLAYLIST".lemonchiffon.blink
#             puts Song.where(mood: "Happy").sort(() => 0.5 - Math.random()).slice(0,10)
#         end
# end


