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
  
end

def create_account(username)
  puts "First time user? Please create a password:"
  password = gets.chomp

  create_user_hash(username, password)
  user = User.new(@user_hash)
  user.save
end

def create_user_hash(username, password)
  @user_hash["username"] = username
  @user_hash["password"] = password
end

def user_is_valid(username)
  password = gets.chomp
  if correct_password?(username, password)
    puts "Logged in!"
  else
    puts "Sorry, that wasn't quite right. Try again:"
    user_is_valid(username)
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

