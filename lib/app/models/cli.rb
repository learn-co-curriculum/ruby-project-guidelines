require "tty-prompt"
require "tty-font"
# require_relative "/../../../db/seeds.rb"
class CLI
    @@prompt = TTY::Prompt.new
    @@pastel = Pastel.new
    @@font = TTY::Font.new(:doom)
    @@chosen_store = nil
    @@resume = nil
    @@first_time_resume = 1

    system("rake db:seed")


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
            self.get_hired
        else
            system('clear')
        end
    end

    def self.build_resume
        system('clear')
        self.title
        prompt = TTY::Prompt.new
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
        
        prompt = TTY::Prompt.new

        chosen_store_arr = @@chosen_store.split

        choosen_store_name_str = "#{chosen_store_arr[0]}" + " #{chosen_store_arr[1]}" + " #{chosen_store_arr[2]}" 

        # get wage, remove dollar sign
        avg_wage = "#{chosen_store_arr[5]}"

        avg_wage = (avg_wage[1..-1]).to_f

        # Employee.create()

        store_obj = Store.all.find { |store| store.name == choosen_store_name_str }

        if @@resume[:hours] < 38 
            full_time = 0
        else 
            full_time = 1
        end

        # salary 
        
        Employee.add_to_db(@@resume[:name], @@resume[:exp], full_time, @@resume[:hours], @@resume[:age], (avg_wage/2.0), store_obj.id)

        


    end




end