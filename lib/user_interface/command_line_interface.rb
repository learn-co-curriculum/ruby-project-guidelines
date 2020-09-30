require "tty-prompt"

class CommandLineInterface

    def welcome
        puts "The Dinner Bell's Ringing! Let's Eat!"
    end

    def username_input
        puts "Please enter a username:"
        username = STDIN.gets.chomp.downcase
    end

    def find_or_create_by_name(username)
        user = User.find_or_create_by(name: username)
        puts "Welcome to Let's Eat #{user.name}!"
    end

    def get_food_order
        prompt = TTY::Prompt.new
        prompt.select("What do you have a taste for?", MenuItem.all.map{|item| item.name})
        # STDIN.gets.chomp.downcase #takes in the user's food request & downcases it.
        #last_call #creates a loop for those who wish to change their food choice
    end

    def last_call
        prompt = TTY::Prompt.new
        choice = prompt.select("Are you sure that's what you want?", ["Yes","No"])
        if choice == "No"
            get_food_order
        else
            puts "Thank you for using Let's Eat!"
        end
        # puts "Are you sure that's what you want? (y/n)" #prompts the user to make a food choice
        # options = STDIN.gets.chomp.downcase #takes a response from the user
        # if options == "y" #if they say y, yes, print message below
        #     puts "Thank you for using Let's Eat!"
        # elsif options == "n" #if they say n, no, loop back to getting the food order
        #     get_food_order #take another food order
        # else #if they put anything besides y or n prints message below and loops this method
        #    puts "Sorry, that was not a valid answer. Please press y for yes or n for no."
        #    last_call #loop this method
        # end
    end

    def user_choice_id(choice)
        user_choice = MenuItem.find_by(name: choice)
        user_choice.id
    end

    def restaurant_menu_item_matches(menu_input)
        matches = RestaurantMenuItem.where(menu_item_id: menu_input)
    end

end