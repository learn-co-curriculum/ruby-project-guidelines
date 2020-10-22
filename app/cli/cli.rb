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

def help_menu
  prompt = TTY::Prompt.new
  choice = prompt.select("What can I do for you?") do |menu|
    menu.choice "View Preferences"
    menu.choice "Update Preferences"
    menu.choice "Events Menu"
    menu.choice "Venues Menu"
    menu.choice "Sign out"
  end

  case choice
  when "View Preferences"
    view_preferences()
  when "Update Preferences"
    update_preferences()
  when "Events Menu"
    events_menu()
  when "Venues Menu"
    venues_menu()
  when "Sign out"
    run()
  end
end

def view_preferences
  
end

def valid_user?(username)
  user = User.find_by username: username
  if user != nil
    @current_user = user
    true
  else
    false
  end
end

def check_password
  prompt = TTY::Prompt.new
  password = prompt.mask

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
    @current_user.save
    puts "You have created an account!"
  else
    run()
  end
end


# runs all methods
def run
  welcome()
  login()

  help_menu()
end