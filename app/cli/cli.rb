require './app/models/user.rb'
require 'pry'

@user_hash = {}

def welcome
  puts "Hi! Welcome to the Event Master!"
end

def login
  puts "Please enter a username:"
  username = gets.chomp
  if valid_user?(username)
    puts "Welcome back! Please enter your password:"
    user_is_valid(username)
  else
    create_account(username)
  end
end

def help_menu
  puts "What can I do for you?"
  puts "1. View user preferences"
  puts "2. Update user preferences"

  input = gets.chomp.to_i
  execute_input(input)
end

def execute_input(input)
  case input
  when 1
    show_user_preferences()
    puts "Would you like to update your preferences? (Y/N)"
    choice = gets.chomp.downcase
    if choice == "y"
      update_user_preferences()
    end
  when 2
    update_user_preferences()
  else
    puts "That isn't a valid selection, please enter a valid selection:"
    help_menu()
  end
end

def show_user_preferences
  if @current_user.genre != nil
    puts "Your current genre preference: #{@current_user.genre}"
  else
    puts "You don't have a current genre preference."
  end
  if @current_user.city != nil
    puts "Your current city preference: #{@current_user.city}"
  else
    puts "You don't have a current city preference."
  end
end

def update_user_preferences
  puts "Please enter a genre. Supported genres are : Pop, Rock, Metal, and Hip-Hop/Rap."
  genre = gets.chomp
  puts "Please enter a city. Supported cities are : San Antonio, Austin, and Cedar Park"
  city = gets.chomp

  @current_user.genre = genre
  @current_user.city = city
  @current_user.save
end

def create_account(username)
  puts "First time user? Please create a password:"
  password = gets.chomp

  create_user_hash(username, password)
  user = User.new(@user_hash)
  user.save
  @current_user = user
end

def create_user_hash(username, password)
  @user_hash["username"] = username
  @user_hash["password"] = password
end

def user_is_valid(name)
  @current_user = User.find_by username: name
  password = gets.chomp
  if correct_password?(name, password)
    puts "Logged in!"
  else
    puts "Sorry, that wasn't quite right. Try again:"
    user_is_valid(name)
  end
end

def valid_user?(name)
  if User.find_by username: name
    return true
  end
  return false
end

def correct_password?(name, password)
  account = User.find_by username: name
  account.password == password
end

