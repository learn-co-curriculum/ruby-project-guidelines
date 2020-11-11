require "tty-prompt"
require 'pry'
class App
    
    def run
        show_intro_fish_tank
        
        sleep(3,)
        setup_owner
        
        main_menu
        
    end
    
    def main_menu
        prompt = TTY::Prompt.new

        my_selection = prompt.select("What would you like to do?") do |menu|
            menu.choice "Create Tank"
            menu.choice "Update Tank"
            menu.choice "See your Tank"
            menu.choice "Add additional owner to the Tank"
            menu.choice "Delete Tank"
            menu.choice "Exit"
        end

        if my_selection == "Create Tank"
            create_tank
        elsif my_selection == "Update Tank"
            update_tank
        elsif my_selection == "See your Tank"
            see_your_tank
        elsif my_selection == "Add additional owner to the Tank"
            add_owner_to_tank
        elsif my_selection == "Delete Tank"
                delete_tank
        elsif my_selection == "Exit"
            nil
        
        end
            
    end

    def get_user_input
        gets.chomp
    end

################# OWNER LOGIN ####################

    def setup_owner
        system "clear"
        prompt = TTY::Prompt.new
        user_input = prompt.select("What's your owner status?") do |menu|
        menu.choice "New Owner"
        menu.choice "Existing Owner"
        end
          if user_input == "New Owner"
          create_new_owner
        else
          find_existing_owner
        end
    end

      def create_new_owner
        puts "Please enter your name:"
        owner_name = gets.chomp
        if Owner.find_by(name: owner_name)
        system "clear"
          puts "Sorry, that name is already taken."
          create_new_owner
        else
          current_user = Owner.create(name: owner_name)
          puts "New user created! Welcome, #{current_user.name.capitalize}!"
        end
        current_user
        binding.pry
      end

      def find_existing_owner
        puts "Please enter your name:"
        owner_name = gets.chomp
        current_user = Owner.find_by(name: owner_name)
        if Owner.all.map { |user| user.name }.include?(owner_name)
        system "clear"
          puts "Welcome back, #{current_user.name.capitalize}!"
        else
          puts "Username not found"
          find_existing_owner
        end
        current_user
      end
################################################################################    

    def create_tank
        puts "What would you like your tank to be named?"
        tank_name = get_user_input
        puts "How many fish would you like to keep? (Max = 10)"
        tank_limit = get_user_input
        new_tank = Tank.new(name: tank_name, fish_limit: tank_limit)
        #new_tank.save
        binding.pry
        new_tank
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
            menu.choice "Back - Main Menu"
        end

        if my_selection == "Add Fish"
            add_fish
        elsif my_selection == "Remove Fish"
            remove_fish
        elsif my_selection == "Back - Main Menu"
            main_menu
        end
    end

####### FISH ADD/REMOVE FEATURES #

    def add_fish
        puts "What would you like to name your fish?"
        fish_name = get_user_input
        prompt = TTY::Prompt.new
        my_selection = prompt.select("What color is the fish?") do |menu|
            menu.choice "Gold"
            menu.choice "Orange"
            menu.choice "Blue"
        end
        fish_size = my_selection
        #Fish.new(name: fish_name, color: fish_color, tank_id: ## ) Need fish ID
        update_tank
    end

    def remove_fish
        puts "What fish would you like to remove?"
        fish_name = get_user_input
        Fish.all.find do |fish|
            fish == fish_name
            Fish.all.delete(fish)
        end
        update_tank
    end

####### END OF FISH ADD/REMOVE FEATURES #

    def see_your_tank
        display_full_tank
    end

    def add_owner_to_tank
    end

    def delete_tank
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

    def display_empty_tank
    puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
    puts "|                                                     |"
    puts "|                                                     |"
    puts "|                                             _\\/_    |"
    puts "|                                              /o\\    |"
    puts "|                                               |     |"  
    puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
    puts "|_____________________________________________________|"
    end
    
    def display_full_tank
    puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
    puts "|    ><>                  <><                  <><    |"
    puts "|                          ><>          <><           |"
    puts "|            ><>                              _\\/_    |"
    puts "|   <><                                ><>     /o\\    |"
    puts "|                         <><                   |  <><|"  
    puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
    puts "|_____________________________________________________|"
    
    end

    def display_tank_one
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
        puts "|                                                     |"
        puts "|                                                     |"
        puts "|                                             _\\/_    |"
        puts "|                          ><>                 /o\\    |"
        puts "|                                               |     |"  
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
        puts "|_____________________________________________________|"
    end

    def display_tank_two
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
        puts "|                                                     |"
        puts "|                                                     |"
        puts "|      ><>                                    _\\/_    |"
        puts "|                                              /o\\    |"
        puts "|                         <><                   |     |"  
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
        puts "|_____________________________________________________|"
    end

    def display_tank_three
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
        puts "|                                                     |"
        puts "|                              <><                    |"
        puts "|         ><>                                 _\\/_    |"
        puts "|                                              /o\\    |"
        puts "|                       <><                     |     |"  
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
        puts "|_____________________________________________________|"
    end

    def display_tank_four
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
        puts "|      <><                        <><                 |"
        puts "|                                                     |"
        puts "|                        ><>                  _\\/_    |"
        puts "|                                              /o\\    |"
        puts "|             ><>                               |     |"  
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
        puts "|_____________________________________________________|"
    end

    def display_tank_six
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
        puts "|                                        <><          |"
        puts "|  ><>                                                |"
        puts "|          ><>                 <><            _\\/_    |"
        puts "|                       <><                    /o\\    |"
        puts "|                  ><>                          |     |"  
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
        puts "|_____________________________________________________|"
    end

    def display_tank_seven
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
        puts "|        ><>                         <><              |"
        puts "|                          <><                        |"
        puts "|        <><                                  _\\/_    |"
        puts "|               ><>                  <><       /o\\    |"
        puts "|   ><>                                         |     |"  
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
        puts "|_____________________________________________________|"
    end

    def display_tank_eight
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
        puts "|                          ><>                 <><    |"
        puts "|         ><>                           ><>           |"
        puts "|                            ><>              _\\/_    |"
        puts "|          <><                         ><>     /o\\    |"
        puts "|                    <><                        |     |"  
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
        puts "|_____________________________________________________|"
    end

    def display_tank_nine
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
        puts "|         ><>             <><        ><>              |"
        puts "|              <><                                    |"
        puts "|                       ><>                   _\\/_    |"
        puts "|     <><                           <><        /o\\    |"
        puts "|                        ><>            <><     |     |"  
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|"
        puts "|_____________________________________________________|"
    end



end








