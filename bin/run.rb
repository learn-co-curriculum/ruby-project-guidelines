<<<<<<< HEAD
require_relative '../config/environment'
require "tty-prompt"


puts "HELLO WORLD"
=======
require_relative '../config/environment'
require_relative '../lib/user_interface/command_line_interface.rb'


welcome
menu_item = get_food_order
#show_restaurants_and_prices(menu_item)


def show_restaurants_and_prices(menu_item) #returns input menu_item
    puts menu_item
end    

#show_restaurants_and_prices(menu_item) #calls method above

#last_call
>>>>>>> 1eac4ca5e946d5ba3b90ea30b8732bde56cfd796
