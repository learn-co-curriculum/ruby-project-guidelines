require "tty-prompt"
require "tty-font"
class CLI
    @@prompt = TTY::Prompt.new
    @@pastel = Pastel.new
    @@font = TTY::Font.new(:doom)


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
        else
            system('clear')
        end
    end

    def self.build_resume
        system('clear')
        self.title
        prompt = TTY::Prompt.new

        resume = prompt.collect do 
            key(:name).ask("What is your name?")

            key(:age).ask("How old are you? (shhhhhh OSHA doesn't exist)", convert: :int)

            key(:hours).ask("How many hours do you want to work a week?", convert: :int)
            
            key(:exp).ask("How many years experience do you have?", convert: :int)
        end

        store_names = Store.all.map {|store| store.name}


        # puts "#{Store.all}"


    end




end