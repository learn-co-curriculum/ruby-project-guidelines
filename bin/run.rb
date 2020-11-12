require_relative '../config/environment'
require_relative '../lib/user_interface/command_line_interface.rb'

new_cli = CommandLineInterface.new

new_cli.welcome

username = new_cli.username_input

account = new_cli.find_or_create_by_name(username)

menu_item = new_cli.get_food_order


item_id = new_cli.user_choice_id(menu_item)

options = new_cli.restaurant_menu_item_matches(item_id)

results = new_cli.user_restaurants(options)

puts results

