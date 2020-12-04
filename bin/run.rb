require_relative '../config/cli_commands'
require_relative '../config/environment'

user_selection = "main menu" 

puts `clear`
puts "Welcome to our Artist App Tracker!"

while true do
    case user_selection
    when "main menu" 
        user_selection = main_menu
    when "list cities"
        list_all_cities
        user_selection = "main menu" 
    when "create account"
        create_account
        #user_selection = "Welcome #{user_input}"
    when "exit" 
        break 
    else 
        ask_for_new_input
        user_selection = "main menu"
    end 
end 
