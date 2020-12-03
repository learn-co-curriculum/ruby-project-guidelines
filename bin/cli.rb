class CLI

    attr_reader :prompt, :font
    attr_accessor :customer



    def main_menu
        @prompt = TTY::Prompt.new
        @font = TTY::Font.new
        @pastel = Pastel.new
        opener
        puts @pastel.cyan(@font.write("                                   Shopping        Cart !!"))
        opener
        prompt = TTY::Prompt.new
        choices = ['🔹Login' ,'🔹Signup', '🔹Exit'] # '🔹Update Name Info', '🔹Delete Account'
        choice = prompt.select("\n                                                      🔹Welcome to Shopping Cart, please make a selection🔹\n", choices) # do not use multi_select it leaves an octogon symble 

        if choice == '🔹Login'
            login
        elsif choice == '🔹Signup'
            signup
        elsif choice == '🔹Exit'
            exit
        end


    end


    def login
        
        shopping
    end

    def profile
    end


    def shopping
        choices = [ '🔹View Profile ', '🔹View Cart', '🔹Get To Shopping','🔹Checkout', '🔹Exit']
    end




    def signup
        login

        shopping
    end

    def exit
        puts "**********"
        puts "Good Bye!"
        puts "**********"
    end






    def opener 
        puts "\n 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 \n "
    end







end
