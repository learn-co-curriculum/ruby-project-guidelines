require "tty-prompt"
require "tty-font"
class CLI
    @@prompt = TTY::Prompt.new
    @@pastel = Pastel.new
    @@font = TTY::Font.new(:doom)
    @@chosen_store = nil
    @@resume = nil
    @@first_time_resume = 1


    def self.title_screen
        system('clear')
        self.title
        self.art
        self.start_menu
    end

    def self.title
        puts @@pastel.blue(@@font.write("Pet Store Simulator", letter_spacing: 2))
    end

    def self.art
        art = <<-HRD
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
        else
            system('clear')
        end
    end

    def self.build_resume
        system('clear')
        self.title
        prompt = TTY::Prompt.new
        if @@first_time_resume
            @@resume = prompt.collect do 
                key(:name).ask("What is your name?")

                key(:age).ask("How old are you? (shhhhhh OSHA doesn't exist)", convert: :int)

                key(:hours).ask("How many hours do you want to work a week?", convert: :int)
                
                key(:exp).ask("How many years experience do you have?", convert: :int)
            end 
            @@first_time_resume = 0
        end

        # store_names = Store.all.each { |store| puts store.name } 

        
        # self.store_stats
        
        

        

        # puts choosen_store
        # puts store_name
        





        # puts "#{Store.all}"


    end

    def self.choose_store
        system('clear')
        self.title
        prompt = TTY::Prompt.new
        @@chosen_store = prompt.select("What store do you want to apply to?\n") do |menu|
            Store.all.map do |store|
                menu.choice "#{store.name.rjust(20)}" + "(General Info Below): \n" + "\tAverage Wage: $#{store.avg_wage}" + "\t |   Number of Employees: #{store.num_emps_at_store}\n"
                
            end
        
        end

        puts @@chosen_store

        puts Store.all

        
    end

    def self.store_stats
        system('clear')
        self.title
        puts @@chosen_store
        prompt = TTY::Prompt.new

        store_obj = Store.all.find { |store| store.name == @@chosen_store }

        puts store_obj.name, store_obj.avg_wage, store_obj.num_emps_at_store

        puts "\tAverage Wage: $#{store_obj.avg_wage}" + "\t Number of Employees: #{store_obj.num_emps_at_store}"

        selection = prompt.select("\n\nDo you want to apply here?") do |opt|
            opt.choice "Yes"
            opt.choice "No (Go back to store list)"
        end

        if selection == "Yes"

        else
            system('clear')
            self.title
            self.choose_store
        end 

        


    end




end