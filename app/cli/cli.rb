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
    exit
  end
end

def view_preferences
  user_prefs = @current_user.attributes
  3.times {user_prefs.shift}

  if user_prefs.values.uniq.include? nil
    puts "Looks like all your preferences haven't been set yet"
    updating_preferences()
  else
    puts "• Genre: #{@current_user.genre}"
    puts "• Minimum Price: #{@current_user.min_price}"
    puts "• Maximum Price: #{@current_user.max_price}"
    puts "• State: #{@current_user.state}"
    puts "• City: #{@current_user.city}"
    puts "• Postal Code: #{@current_user.postal_code}"
  end
end

def updating_preferences
  prompt = TTY::Prompt.new
  input = prompt.yes?("Would you like to update them now?")
  if input
    update_preferences()
  else 
    help_menu()
  end 
end

def update_preferences
  prompt = TTY::Prompt.new
  input = prompt.select("Which preferences would you like to update?") do |menu|
    menu.choice "Genre"
    menu.choice "Minimum Price"
    menu.choice "Maximum Price"
    menu.choice "State"
    menu.choice "City"
    menu.choice "Postal Code"
  end
  
  case input
  when "Genre"
    update_genre()
  when "Minimum Price"
    update_min_price()
  when "Maximum Price"
    update_max_price()
  when "State"
    update_state()
  when "City"
    update_city()
  when "Postal Code"
    update_postal_code()
  end
end

def update_genre
  genres = Event.all.map do |event|
    event.genre
  end

  genres.uniq!

  prompt = TTY::Prompt.new
  input = prompt.select("Which genre do you prefer?", genres)
  @current_user.genre = input
  @current_user.save
end

def update_min_price
  prompt = TTY::Prompt.new
  input = prompt.ask("Please enter a minimum price:")

  @current_user.min_price = input.to_f
  @current_user.save
end

def update_max_price
  prompt = TTY::Prompt.new
  input = prompt.ask("Please enter a maximum price:")

  @current_user.max_price = input.to_f
  @current_user.save
end

def update_city
  cities = Venue.all.map do |venue|
    venue.city
  end

  cities.uniq!

  prompt = TTY::Prompt.new
  input = prompt.select("Which city do you want to see concerts in?", cities)
  @current_user.city = input
  @current_user.save
end

def update_state
  states = Venue.all.map do |venue|
    venue.state
  end

  states.uniq!

  prompt = TTY::Prompt.new
  input = prompt.select("Which state do you want to see concerts in?", states)
  @current_user.state = input
  @current_user.save
end

def update_postal_code
  postals = Venue.all.map do |venue|
    venue.postal_code
  end

  postals.uniq!

  prompt = TTY::Prompt.new
  input = prompt.select("Which postal code do you want to see concerts in?", postals)
  @current_user.postal_code = input
  @current_user.save
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