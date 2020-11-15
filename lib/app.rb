class App

    attr_accessor :current_user
    attr_reader :fish

    def run
        bubble_sound
        show_intro_fish_tank
        sleep(3,)
        setup_owner
        main_menu
    end

    def main_menu
        system "clear"
        display_main_menu_title
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
            return
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
          @current_user = Owner.create(name: owner_name)
          puts "New user created! Welcome, #{current_user.name.capitalize}!"
        end
      end

      def find_existing_owner
        puts "Please enter your name:"
        owner_name = gets.chomp
        @current_user = Owner.find_by(name: owner_name)
        if Owner.all.map { |user| user.name }.include?(owner_name)
        system "clear"
          puts "Welcome back, #{current_user.name.capitalize}!"
        else
          puts "Username not found"
          find_existing_owner
        end
      end
################################################################################

    def create_tank
        puts "What would you like your tank to be named?"
        tank_name = get_user_input
        puts "How many fish would you like to keep? (Max = 10)"
        tank_limit = get_user_input.to_i
        if tank_limit > 10 
            puts "Sorry, the tank is not big enough for more than 10 fish!"
            sleep(2,)
            system "clear"
            create_tank
        else
        new_tank = Tank.create(name: tank_name, fish_limit: tank_limit)
        TankOwnerId.create(owner_id: current_user.id , tank_id: new_tank.id)
        end
        puts "Congratulations! Your new tank #{tank_name} has been created."
        sleep(2,)
        main_menu
    end

    def update_tank
        display_tank_update_selection
        display_my_fish_tank
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

##################### FISH ADD/REMOVE FEATURES ################################################

    def tank_fish_count
        my_tank = Tank.find_by(name: @my_selection)
        my_tank.fish.count
    end


    def add_fish

        if tank_fish_count.to_i < 10
            puts "What would you like to name your fish?"
            fish_name = get_user_input
            prompt = TTY::Prompt.new
            color_selection = prompt.select("What color is the fish?") do |menu|
                menu.choice "Gold"
                menu.choice "Orange"
                menu.choice "Blue"
            end
            fish_color = color_selection
            my_tank = Tank.find_by(name: @my_selection)
            Fish.create(name: fish_name, color: fish_color, tank_id: my_tank.id)
            system "clear"
            display_my_fish_tank
            water_splash
            sleep(3,)
            main_menu
        else
            puts "Sorry, the tank is full!"
            sleep(2,)
            main_menu
        end
    end

    def remove_fish
        puts "What fish would you like to remove?"
        prompt = TTY::Prompt.new
        deleted_fish = prompt.select("Which fish would you like to remove?", (display_my_fish_names))

        my_tank = Tank.find_by(name: @my_selection)
            my_fish = my_tank.fish.find_by(name: deleted_fish)

            my_fish.destroy
            system "clear"
            flush_sound
            puts "Your fish has been successfully removed :("
            sleep(4.4,)

        main_menu
    end

##################### END OF FISH ADD/REMOVE FEATURES ########################################

    def see_your_tank
        display_tank_view_selection
        display_my_fish_tank
        puts display_tank_owners

        prompt = TTY::Prompt.new
        go_back = prompt.select("Select Main Menu to go back") do |menu|
            menu.choice "Main Menu"
        end
        if go_back == "Main Menu"
            main_menu
        end
    end

    def add_owner_to_tank
            # DIPLAY ALL CURRENT OWNER TANKS
            my_tanks = current_user.tanks.map do |tank|
                tank.name
            end
            if my_tanks.count == 0
                puts "You have no tanks to add owners to, please go back and create a tank first!"
                sleep(2,)
                main_menu
            else
            prompt = TTY::Prompt.new
            add_owner_to = prompt.select("Which tank would you like to add an owner to", (my_tanks))
            end
            #SELECT TANK THAT WE WANT TO ADD OWNER TO
            my_tank = Tank.find_by(name: add_owner_to)
            #ASK WHAT OWNER TO ADD
            puts "Please type the name of the owner you would like to add"
            additonal_owner = get_user_input
            #DOES THAT OWNER EXIST, IF YES THEN RUN METHOD IF NO = ELSE. 
            new_owner = Owner.find_by(name: additonal_owner)
            if Owner.find_by(name: additonal_owner) && !TankOwnerId.find_by(owner_id: new_owner.id, tank_id: my_tank.id)
               TankOwnerId.create(owner_id: new_owner.id , tank_id: my_tank.id)
               puts "New owner, #{new_owner.name} has been added to #{my_tank.name}"
               sleep(2,) 
               main_menu
            else
                puts "Sorry that owner was not found or that relationship already exists. Please try again."
                sleep(2,)
                main_menu
            end
    end

    def delete_tank
        prompt = TTY::Prompt.new
        selected_tank = prompt.select("What is the name of the tank that you would like to delete?", (display_my_tanks))
        deleted_tank = Tank.find_by(name: selected_tank)

        deleted_tank.destroy
        glass_sound
        puts "Your tank has been deleted successfully."
        sleep(2,)
        main_menu
    end

###################################### DISPLAY SECTION #########################################

    def display_tank_update_selection
        current_user.reload
        my_tanks = current_user.tanks.map do |tank|
            tank.name
        end
        if my_tanks.count == 0
            puts "You have no tanks to update, please go back and create a tank first!"
            sleep(2,)
            main_menu
        else
        prompt = TTY::Prompt.new
        @my_selection = prompt.select("Which tank would you like to update?", (my_tanks))
        end
    end

    def display_tank_owners
        my_tank = Tank.find_by(name: @my_selection)
        tank_owners = my_tank.owners
        tank_owners.collect do |owner|
            owner.name.capitalize
        end
    end

    def display_my_fish_tank
        my_tank = Tank.find_by(name: @my_selection)
    if my_tank.fish.count == 0
        display_empty_tank
    elsif my_tank.fish.count == 1
        display_tank_one
    elsif my_tank.fish.count == 2
        display_tank_two
    elsif my_tank.fish.count == 3
        display_tank_three
    elsif my_tank.fish.count == 4
        display_tank_four
    elsif my_tank.fish.count == 5
        display_tank_five
    elsif my_tank.fish.count == 6
        display_tank_six
    elsif my_tank.fish.count == 7
        display_tank_seven
    elsif my_tank.fish.count == 8
        display_tank_eight
    elsif my_tank.fish.count == 9
        display_tank_nine
    elsif my_tank.fish.count == 10
        display_full_tank
    end
end
   
    def display_my_fish_names
        my_tank = Tank.find_by(name: @my_selection)
        my_fish = my_tank.fish
        my_fish.map do |fish|
            fish.name
        end
    end

    def display_my_tanks
        current_user.reload
        my_tanks = current_user.tanks.map do |tank|
            tank.name
        end
    end

    def display_tank_view_selection
        current_user.reload
        my_tanks = current_user.tanks.map do |tank|
            tank.name
        end
        if my_tanks.count == 0
            puts "You have no tanks to view, please go back and create a tank first!"
            sleep(2,)
            main_menu
        else
        prompt = TTY::Prompt.new
        @my_selection = prompt.select("Which tank would you like to view", (my_tanks))
        end
    end

        def display_title_intro
            font = TTY::Font.new("Doom")
            pastel = Pastel.new
            puts pastel.cyan(font.write("WELCOME TO RUBY TANK"))
        end

        def display_main_menu_title
            font = TTY::Font.new("Standard")
            pastel = Pastel.new
            puts pastel.cyan(font.write("RUBY TANK"))
        end
    

    ############################### DISPLAY SECTION END #########################################
    
    ############################### SOUND EFFECTS #####################################

    def bubble_sound
        pid = fork{exec 'afplay', "lib/Large_bubble_sound.mp3"}
    end
    
    def flush_sound
        pid = fork{exec 'afplay', "lib/flush_sound.mp3"}
    end

    def glass_sound
        pid = fork{exec 'afplay', "lib/glass_sound.mp3"}
    end

    def water_splash
        pid = fork{exec 'afplay', "lib/water_splash.mp3"}
    end
    ############################### SOUND EFFECTS END #####################################

    ################################## VISUAL IMAGES ##################################
    
    def show_intro_fish_tank
        display_title_intro
        puts"                                                                           ".blue
        puts"      ___ ___ ___ ___                                              ((      ".blue
        puts"     |___|___|___|___|                                           (())      ".blue
        puts"       |:_:_:_:_:_|    ".blue + "><>".red + "                                      ))         ".blue
        puts"       |_:_,--.:_:|                          ".blue + "<><".red + "             (///   )      ".blue
        puts"       |:_:|__|_:_|          ".blue + "><>".red + "         _                  ) ))   ((      ".blue
        puts"    _  |_   _  :_:|   _   _   _         (_)                ((((   /))`     ".blue
        puts"   | |_| |_| |   _|  | |_| |_| |          o                 )))) (( (      ".blue
        puts"    |_:_:_:_:/|_|_|_| :_:_:_:_/          .        ".blue + "<><".red + "        ((   ))))     ".blue
        puts"     |_,-._:_:_:_:_:_:_:_.-,_|        o                        )) ((//     ".blue
        puts"     |:|_|:_:_:,---,:_:_:|_|:|         o                      ,-.  )/      ".blue
        puts"     |_:_:_:_,'     `,_:_:_:_|           _ o               ,;'))((         ".blue
        puts"     |:_:_:_/  _ | _   _:_:_:|          (_O                   ((  ))       ".blue
        puts"_____|_:_:_|  (o)-(o)  |_:_:_|--'`-.     ,--.                (((('/        ".blue
        puts" ', ;|:_:_:| -( .-. )- |:_:_:| ', ; `--._|oo|,---.~           ``))         ".blue
        puts".  ` |_:_:_|   (`-')   |_:_:_|.  ` .  `  |()|.__( ) .,-----' `-(((         ".blue
        puts" ', ;|:_:_:|    `-'    |:_:_:| ', ; ', ; `--'|   \ ', ; ', ; ',')).,--     ".blue
        puts"  .  `  ` .  ` .  ` .  ` .  ` .  ` .  ` .    .  ` .  ` .  ` .  ` .  `      ".yellow
        puts" ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ', ;    ".yellow
    end
   
    def display_empty_tank
    puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
    puts "|                                                     |".blue
    puts "|                                                     |".blue
    puts "|                                             _\\/_    |".blue
    puts "|                                              /o\\    |".blue
    puts "|                                               |     |".blue
    puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
    puts "|_____________________________________________________|".yellow
    end
    
    def display_full_tank
    puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|" .blue
    puts "|    ><>                  <><                  <><    |" .blue
    puts "|                          ><>          <><           |" .blue
    puts "|            ><>                              _\\/_    |".blue
    puts "|   <><                                ><>     /o\\    |".blue
    puts "|                         <><                   |  <><|" .blue
    puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|" .yellow
    puts "|_____________________________________________________|" .yellow
     
    end

    def display_tank_one
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
        puts "|                                                     |".blue
        puts "|                                                     |".blue
        puts "|                                             _\\/_    |".blue
        puts "|                          ><>                 /o\\    |".blue
        puts "|                                               |     |"  .blue
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
        puts "|_____________________________________________________|".yellow
    end

    def display_tank_two
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
        puts "|                                                     |".blue
        puts "|                                                     |".blue
        puts "|      ><>                                    _\\/_    |".blue
        puts "|                                              /o\\    |".blue
        puts "|                         <><                   |     |"  .blue
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
        puts "|_____________________________________________________|".yellow
    end

    def display_tank_three
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
        puts "|                                                     |".blue
        puts "|                              <><                    |".blue
        puts "|         ><>                                 _\\/_    |".blue
        puts "|                                              /o\\    |".blue
        puts "|                       <><                     |     |"  .blue
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
        puts "|_____________________________________________________|".yellow
    end

    def display_tank_four
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
        puts "|      <><                        <><                 |".blue
        puts "|                                                     |".blue
        puts "|                        ><>                  _\\/_    |".blue
        puts "|                                              /o\\    |".blue
        puts "|             ><>                               |     |"  .blue
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
        puts "|_____________________________________________________|".yellow
    end

    def display_tank_five
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
        puts "|      <><                        <><                 |".blue
        puts "|                ><>                                  |".blue
        puts "|                        ><>                  _\\/_    |".blue
        puts "|                                              /o\\    |".blue
        puts "|             ><>                               |     |"  .blue
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
        puts "|_____________________________________________________|".yellow
    end

    def display_tank_six
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
        puts "|                                        <><          |".blue
        puts "|  ><>                                                |".blue
        puts "|          ><>                 <><            _\\/_    |".blue
        puts "|                       <><                    /o\\    |".blue
        puts "|                  ><>                          |     |"  .blue
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
        puts "|_____________________________________________________|".yellow
    end

    def display_tank_seven
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
        puts "|        ><>                         <><              |".blue
        puts "|                          <><                        |".blue
        puts "|        <><                                  _\\/_    |".blue
        puts "|               ><>                  <><       /o\\    |".blue
        puts "|   ><>                                         |     |"  .blue
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
        puts "|_____________________________________________________|".yellow
    end

    def display_tank_eight
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
        puts "|                          ><>                 <><    |".blue
        puts "|         ><>                           ><>           |".blue
        puts "|                            ><>              _\\/_    |".blue
        puts "|          <><                         ><>     /o\\    |".blue
        puts "|                    <><                        |     |"  .blue
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
        puts "|_____________________________________________________|".yellow
    end

    def display_tank_nine
        puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|".blue
        puts "|         ><>             <><        ><>              |".blue
        puts "|              <><                                    |".blue
        puts "|                       ><>                   _\\/_    |".blue
        puts "|     <><                           <><        /o\\    |".blue
        puts "|                        ><>            <><     |     |"  .blue
        puts "|,,,,......,,,,...,,..,.,..,,..,,..,,,,,,,..,.,.|..,.,|".yellow
        puts "|_____________________________________________________|".yellow
    end
    
end








