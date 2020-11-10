require "tty-prompt"

class App
    
    def run 
        welcome
    end
    
    def welcome
        show_intro_fish_tank
        get_name
        
        main_menu
        
    end
    
    def main_menu
        prompt = TTY::Prompt.new

        my_selection = prompt.select("What would you like to do?") do |menu|
            menu.choice "Create Tank"
            menu.choice "Update Tank"
            menu.choice "See your Tank"
            menu.choice "Delete Tank"
        end

        if my_selection == "Create Tank"
            create_tank
        elsif my_selection == "Update Tank"
            update_tank
        elsif my_selection == "See your Tank"
            see_your_tank
        elsif my_selection == "Delete Tank"
                delete_tank
        
        end
            
    end

    def get_user_input
        gets.chomp
    end

    def get_name
        puts "What is your name?"
        user_input = get_user_input
        Owner.new(user_input)
    end

    def create_tank
        puts "What would you like your tank to be named?"
        tank_name = get_user_input
        puts "How many fish would you like to keep? (Max = 10)"
        fish_limit = get_user_input
        Tank.new(tank_name, fish_limit)
        main_menu
    end

    def update_tank
        if Fish.all.count == 0 
            display_empty_tank
        else
            display_full_tank
        end

        prompt = TTY::Prompt.new
        my_selection = prompt.select("What would you like to do? Add or remove fish?") do |menu|
            menu.choice "Add Fish"
            menu.choice "Remove Fish"
        end

        if my_selection == "Add Fish"
            add_fish
        elsif my_selection == "Remove Fish"
            remove_fish
        end
    end

####### FISH ADD/REMOVE FEATURES #
    def add_fish
        puts "What would you like to name your fish?"
        fish_name = get_user_input
        puts "What color is the fish?"
        fish_color = get_user_input
        prompt = TTY::Prompt.new
        my_selection = prompt.select("What size is the fish?") do |menu|
            menu.choice "Small"
            menu.choice "Medium"
            menu.choice "Large"
        end
        fish_size = my_selection
        Fish.new(fish_name, fish_color, fish_size)
        update_tank
    end

    def remove_fish
        puts "What fish would you like to remove?"
        fish_name = get_user_input
    end

####### END OF FISH ADD/REMOVE FEATURES #

    def see_your_tank
    end

    def delete_tank
    end

    def display_empty_tank
    puts "|^^^^^^^^^^^^^^^^|"
    puts "|                |"
    puts "|________________|"
    end
    
    def display_full_tank
    puts "|^^^^^^^^^^^^^^^^|"
    puts "| ><>       <><  |"
    puts "|________________|"

    end





    ################################## VISUAL IMAGES ##################################

    def show_intro_fish_tank
    puts"                                                                           "
    puts"      ___ ___ ___ ___          WELCOME TO RUBY TANK                ((      "
    puts"     |___|___|___|___|                                           (())      "
    puts"       |:_:_:_:_:_|     ><>                                     ))         "
    puts"       |_:_,--.:_:|                           <><            (///   )      "
    puts"       |:_:|__|_:_|         ><>          _                  ) ))   ((      "
    puts"    _  |_   _  :_:|   _   _   _         (_)                ((((   /))`     "
    puts"   | |_| |_| |   _|  | |_| |_| |          o                 )))) (( (      "
    puts"    |_:_:_:_:/|_|_|_| :_:_:_:_/          .         <><       ((   ))))     "
    puts"     |_,-._:_:_:_:_:_:_:_.-,_|        o                        )) ((//     "
    puts"     |:|_|:_:_:,---,:_:_:|_|:|         o                      ,-.  )/      "
    puts"     |_:_:_:_,'     `,_:_:_:_|           _ o               ,;'))((         "
    puts"     |:_:_:_/  _ | _   _:_:_:|          (_O                   ((  ))       "
    puts"_____|_:_:_|  (o)-(o)  |_:_:_|--'`-.     ,--.                (((('/        "
    puts" ', ;|:_:_:| -( .-. )- |:_:_:| ', ; `--._|oo|,---.~           ``))         "
    puts".  ` |_:_:_|   (`-')   |_:_:_|.  ` .  `  |()|.__( ) .,-----' `-(((         "
    puts" ', ;|:_:_:|    `-'    |:_:_:| ', ; ', ; `--'|   \ ', ; ', ; ',')).,--     "
    puts"  .  `  ` .  ` .  ` .  ` .  ` .  ` .  ` .    .  ` .  ` .  ` .  ` .  `      "
    puts" ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ', ;    "
    end
end








