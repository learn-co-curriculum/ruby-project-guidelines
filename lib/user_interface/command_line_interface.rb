require "tty-prompt"

class CommandLineInterface

    def welcome
        puts "The Dinner Bell's Ringing! Let's Eat!"
    end

    def username_input
        puts "Please enter a username:"
        username = gets.chomp.downcase
    end

    def find_or_create_by_name(username)
        user = User.find_or_create_by(name: username)
        puts "Welcome to Let's Eat #{user.name}!"
    end

    def get_food_order
        prompt = TTY::Prompt.new
        prompt.select("What do you have a taste for?", MenuItem.all.map{|item| item.name})
    end

    def last_call
        prompt = TTY::Prompt.new
        choice = prompt.select("Are you sure?", ["Yes","No"])
        if choice == "No" #loops the whole thing if they say no
            fav = get_food_order
            fave = user_choice_id(fav)
            favor = restaurant_menu_item_matches(fave)
            user_restaurants(favor)
        else
            puts "Thank you for using Let's Eat!"
        end
    end

    def user_choice_id(choice)
        user_choice = MenuItem.find_by(name: choice)
            user_choice.id
    end

    def restaurant_menu_item_matches(menu_input)
        matches = RestaurantMenuItem.where(menu_item_id: menu_input).limit(100)
        matches.map do |match|
            match.restaurant_id
        end
    end

    def user_restaurants(match)
        restaurant_picks = Restaurant.where(id: match).limit(100)
        restaurant_names = restaurant_picks.map do |picks|
            picks.name
        end
        prompt = TTY::Prompt.new
        prompt.select("Where do you want to go?", restaurant_names)
        last_call 
    end

end