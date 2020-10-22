require 'pry'
require_relative '../../config/environment.rb'

def welcome
  system 'clear'
  
  font = TTY::Font.new(:standard)
  pastel = Pastel.new
  puts pastel.cyan(font.write("Event    Finder"))
end

def login
  puts "Please enter a username:"
  username = gets.chomp

  if valid_user?(username)
    puts 'Welcome back! Please enter your password: (type "exit" to go back)'
    check_password()
  else
    create_account(username)
  end
end

def valid_user?(username)
  if User.find_by username: username != nil
    @current_user = User.find_by username: username
    true
  else
    false
  end
end

def check_password
  password = gets.chomp

  if @current_user.password == password
    puts "Logged in!"
  elsif password.downcase == "exit"
    run()
  else
    puts "Looks like that doesn't match, try again!"
    check_password()
  end
end

def create_account(username)
  puts "First time user? (Y/N)"
  input = gets.chomp.downcase
  if input == "y"  
    puts "Create an account! Please enter a password:"
    password = gets.chomp

    @current_user = User.create(username: username, password: password)
    puts "You have created an account!"
    @current_user.save
  else
    run()
  end
end


# runs all methods
def run
  welcome()
  login()
end