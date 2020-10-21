require './app/models/user.rb'
require './app/models/password.rb'
require 'pry'

@user_hash = {}

def welcome
  puts "Hi! Welcome to the Ticket Machine!"
end

def login
  puts "Please enter a username:"
  username = gets.chomp
  if valid_user?(username)
    user_is_valid(username)
  else
    user_hash(username)
    create_account(username)
  end
end

def create_account(username)
  user = User.new(@user_hash)
  user.save

  puts "First time user? Please create a password:"
  input = gets.chomp

  password = Password.new
end

def user_hash(username = nil, password = nil)
  if username == nil && password == nil
    @user_hash = {
    "username" => username,
    "password" => password
  }
  else
    @user_hash
  end
end

def user_is_valid(username)
  puts "Welcome back! Please enter your password:"
  password = gets.chomp
  if correct_password?(username, password)
    puts "Logged in!"
  else
    puts "Sorry, that wasn't quite right. Try again!"
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