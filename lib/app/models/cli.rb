require "tty-prompt"
class CLI
    @@prompt = TTY::Prompt.new
    @@pastel = Pastel.new


    def self.title_screen
        system('clear')
        self.title
        
    end

    def self.title
        puts @@pastel.red(@@font.write("Pet Store Simulator", letter_spacing: 1))
    end


end