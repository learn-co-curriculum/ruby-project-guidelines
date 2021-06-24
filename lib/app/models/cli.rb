require "tty-prompt"
require "tty-font"
require "tty-table"
# require_relative "/../../../db/seeds.rb"
# require_relative "/ascii_art"
class CLI
    @@prompt = TTY::Prompt.new
    @@pastel = Pastel.new
    @@font = TTY::Font.new(:doom)
    @@chosen_store = nil
    @@resume = nil
    @@user = nil
    @@boss_name

    # system('rake db:seed')

    def self.print_title_art
        art = <<-'HRD'
                      /^--^\     /^--^\     /^--^\
                      \____/     \____/     \____/
                     /      \   /      \   /      \
                    |        | |        | |        |
                     \__  __/   \__  __/   \__  __/
|^|^|^|^|^|^|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|^|^|^|^|^|
| | | | | | | | | | | | |\ \| | |/ /| | | | | | \ \ | | | | | | | | | | |
########################/ /######\ \###########/ /#######################
| | | | | | | | | | | | \/| | | | \/| | | | | |\/ | | | | | | | | | | | |
|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|
    HRD
    puts art
    end

    def self.print_resume_art

        art = <<-'HRD'
                          _______
                         | ___  o|
                         |[_-_]_ |
      ______________     |[_____]|
     |.------------.|    |[_____]|
     ||            ||    |[====o]|
     ||    Job     ||    |[_.--_]|
     ||Application ||    |[_____]|
     ||            ||    |      :|
     ||____________||    |      :|
 .==.|""  ......    |.==.|      :|
 |::| '-.________.-' |::||      :|
 |''|  (__________)-.|''||______:|
 `""`_.............._\""`______
    /:::::::::::'':::\`;'-.-.  `\
   /::=========.:.-::"\ \ \--\   \
   \`""""""""""""""""`/  \ \__)   \
    `""""""""""""""""`    '========'
    HRD
    puts art
    end

    def self.print_boss_art
        art = <<-'HRD'
                                
                   ;;;;;;;;;;;;;;;;;
                ;;;;;;;;;;;;     ;;;;;
               ;;;;;    ;;;         \;;
              ;;;;;      ;;          |;
             ;;;;         ;          |
             ;;;                     |
              ;;                     )
               \    ~~~~ ~~~~~~~    /
                \    ~~~~~~~  ~~   /
              |\ \                / /|
               \\| %%%%%    %%%%% |//
              [[====================]]
               | |  ^          ^  |
               | | :@: |/  \| :@: | |
                \______/\  /\______/
                 |     (@\/@)     |
                /                  \
               /  ;-----\  ______;  \
               \         \/         /
                )                  (
               /                    \
               \__                  /
                \_                _/
                 \______/\/\______/
                  _|    /--\    |_
                 /%%\  /"'"'\  /%%\
  ______________/%%%%\/\'"'"/\/%%%%\______________
 / :  :  :  /  .\%%%%%%%\"'/%%%%%%%/.  \  :  :  : \
)  :  :  :  \.  .\%%%%%%/'"\%%%%%%/.  ./  :  :  :  (

        HRD
        puts art
    end


    def self.title_screen
        system('clear')
        self.title
        self.print_title_art
        self.start_menu
    end

    def self.title
        puts @@pastel.blue(@@font.write("Pet Store Simulator", letter_spacing: 2))
    end

    # def self.art

    # end

    def self.start_menu
        new_prompt = TTY::Prompt.new

        selection = new_prompt.select("\n\n Welcome to your new Job!") do |option|
            option.choice "Start Game"
            option.choice "Quit Game"
        end 

        if selection == "Start Game"
            self.build_resume
            self.choose_store
            # self.store_stats
            self.get_hired
            self.start_work
        else
            system('clear')
        end
    end

    def self.build_resume
        system('clear')
        self.title
        self.print_resume_art
        prompt = TTY::Prompt.new
        puts "Let's make a Job Application!\n\n"
        @@resume = prompt.collect do 
            key(:name).ask("What is your name?")

            key(:age).ask("How old are you? (shhhhhh OSHA doesn't exist)", convert: :int)
            
            key(:hours).ask("How many hours do you want to work a week?", convert: :int)

            key(:exp).ask("How many years experience do you have?", convert: :int)
        end 

    end

    def self.choose_store
        system('clear')
        self.title
        prompt = TTY::Prompt.new
        @@chosen_store = prompt.select("What store do you want to apply to?\n") do |menu|
            Store.all.map do |store|
                menu.choice "#{store.name.rjust(20)}" + "\n\tAverage Wage: $#{store.avg_wage}" + "\t |   Number of Employees: #{store.num_emps_at_store}\n"
            end
        end

    end

    def self.get_hired
        system('clear')
        self.title
        self.print_boss_art
        
        # prompt = TTY::Prompt.new

        chosen_store_arr = @@chosen_store.split

        choosen_store_name_str = "#{chosen_store_arr[0]}" + " #{chosen_store_arr[1]}" + " #{chosen_store_arr[2]}" 
        # get the store owner's name
        boss_name = "#{chosen_store_arr[0]}"
        @@boss_name = boss_name[0..((boss_name.length) - 3)]
        
        # get wage, remove dollar sign
        # avg_wage = "#{chosen_store_arr[5]}"

        # avg_wage = (avg_wage[1..-1]).to_f

        store_obj = Store.all.find { |store| store.name == choosen_store_name_str }

        avg_wage = store_obj.avg_wage

        if @@resume[:hours] < 38 
            full_time = 0
        else 
            full_time = 1
        end

        puts "#{@@boss_name}:  Congratulations, #{@@resume[:name]}, you're hired! Since you only have #{@@resume[:exp]} years of experience,\n\t you'll be payed half of our average salary and work 10 more hours than you asked,\n\t because, ya know, capitalism"
        puts "\nStarting Salary: $#{(avg_wage/2.0).to_i}\tHours Scheduled: #{(@@resume[:hours] + 10)}"
        # salary 
        
        @@user = Employee.add_to_db(@@resume[:name], @@resume[:exp], full_time, (@@resume[:hours] + 10), @@resume[:age], (avg_wage/2.0).to_i, store_obj.id)
        puts @@user.pets_at_my_store
    end

    def self.start_work
        sleep(8)
        system('clear')
        self.title
        # for some reason using @@user.pets later was causing bugs
        user_obj = Employee.all.find {|emp| emp.id == @@user.id}
        
        5.times do 
            Adoption.create(employee_id: user_obj.id, pet_id: Pet.ids.sample)
        end
        new_prompt = TTY::Prompt.new

        selection = new_prompt.select("\n\n You're at work now, what do you want to do?\n\n") do |option|
            option.choice "View the all of the pets that I have" # kyle
            option.choice "Adopt a new pet" # new adoption instance # kyle
            option.choice "Change my schedule" # change hours #kyle 
            option.choice "EWWWW! What's that smell?" #remove the dead pets Lindsay 
            option.choice "Change what store I work at" #change store Lindsay 
            option.choice "Quit my job!" # delete employee instance (the @@user/user_obj) Lindsay 
            # for quitting, Delete the obj from the db (.delete), then call self.start_menu
        end 

        if selection == "View the all of the pets that I have"



            all_pets = user_obj.pets.each_with_object([]) do |pet, fin_arr|

                vals = pet.attributes.values

                # check to see if the user got a new pet, if so add it to vals
                # if (user_obj.pets.last != Pet.last) && (user_obj.pets.last.id == Pet.last.id)

                #     vals += Pet.last.attributes.values

                # end

                vals_as_strs = vals.map do |val|
                    val.to_s
                end 

                fin_arr << vals_as_strs[1..-1]
            end 

            


            table = TTY::Table.new(["Nickname","Species", "Weight (lbs)", "Age", "Alive", "Years in Captivity", "Price ($)"], [all_pets[0], all_pets[1], all_pets[2], all_pets[3], all_pets[4]])
            puts table.render(:ascii)
            sleep(2)
            self.start_work
        elsif selection == "Adopt a new pet"
            # self.adopt_a_new_pet
            system('clear')
            self.title
            new_prompt = TTY::Prompt.new
    
            puts "\n\nTime to get a new pet!\n\n"
    
            selection_hash = new_prompt.collect do 
                key(:species).ask("What species is the pet?")
    
                key(:nickname).ask("What is the pet's nickname?")
            end 
    
            system('clear')
            self.title
            
    
            new_pet = Pet.create(nickname: selection_hash[:nickname], species: selection_hash[:species], weight: rand(1.0..20.0).round(2), age: rand(1..20), alive: rand(0..1), years_in_captivity: 0, price: rand(1.5...100.0).round(2))
            Adoption.create(employee_id: @@user.id, pet_id: new_pet.id)
    
    
            
    
            self.print_boss_art
            puts "#{@@boss_name}:  Alright, #{@@resume[:name]}, fine--I got that new pet you wanted. Its name is #{new_pet.nickname},\n\t and it's an #{new_pet.weight} lbs #{new_pet.age}-year-old #{new_pet.species}. \n\t And the $#{new_pet.price} it costed is coming out of YOUR paycheck!"
            
    
            sleep(6)
            
            self.start_work
        
        end 

    end

    def self.adopt_a_new_pet



    end

    




end