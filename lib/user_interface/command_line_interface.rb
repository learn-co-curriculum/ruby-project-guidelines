require "tty-prompt"

class CommandLineInterface
    attr_accessor :user, :user_choice  
    def welcome
        puts "The Dinner Bell's Ringing! Let's Eat!"
    end

    def username_input
        puts "Please enter a username:"
        username = gets.chomp.downcase
    end

    def find_or_create_by_name(username)
        @user = User.find_or_create_by(name: username)
        puts "Welcome to Let's Eat #{user.name}!"
    end

    def get_food_order
        prompt = TTY::Prompt.new
        prompt.select("What do you have a taste for?", MenuItem.all.map{|item| item.name})
    end

    def last_call(east)
        prompt = TTY::Prompt.new
        choice = prompt.select("Are you sure?", ["Yes","No"])
        if choice == "No" #loops the whole thing if they say no
            fav = get_food_order
            fave = user_choice_id(fav)
            favor = restaurant_menu_item_matches(fave)
            user_restaurants(favor)
        else
            account = @user 
            account.update(menu_item_id: @user_choice.id)
            rest_id = Restaurant.find_by(name: east)
            account.update(restaurant_id: rest_id.id)
            #binding.pry
            puts "Thank you for using Let's Eat!"
        end
    end

    def user_choice_id(choice)
        @user_choice = MenuItem.find_by(name: choice)
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
       east = prompt.select("Where do you want to go?", restaurant_names)
        #binding.pry
        last_call(east) 
    end

end