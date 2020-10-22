require 'pry'

def welcome
  system 'clear'
  
  font = TTY::Font.new(:standard)
  pastel = Pastel.new
  puts pastel.cyan(font.write("Event    Finder"))
end

def login
  puts "Please enter a username:"
end