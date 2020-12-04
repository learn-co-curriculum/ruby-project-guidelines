#require_relative '../config/cli_commands'
require_relative '../config/environment'

user_selection = "main menu" 

puts `clear`
puts "Welcome to our Artist App Tracker!"
artist = nil
while true do
    case user_selection
    when "main menu" 
        user_selection = main_menu
    when "list cities"
        list_all_cities
        user_selection = "main menu" 
    when "create account"
        artist = create_account
        user_selection = "Welcome!"
    when "Welcome!"
        create_a_show
        #user_selection = "something"
    when "exit" 
        break 
    else 
        ask_for_new_input
        user_selection = "main menu"
    end 
end 
