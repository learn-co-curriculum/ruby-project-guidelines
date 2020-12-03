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

    
    def signup

        #create user_name & password -> update the table
        shopping
    end

    def login
        #gets user_name & password -> check if password matches user_name in table else 1. Error Msg 2. Exit 3. Re-login 4. Reset Password -> Signup
        shopping
    end

    def shopping
        choices = [ '🔹View Profile ', '🔹View Cart', '🔹Get To Shopping','🔹Checkout', '🔹Exit']
    end

    def profile
        #reset user_name & password
        go_back 
    end

    def go_back
        -> if else
    end

    def go_to_shopping
        # # choose from aisles choices = [fruits, vegetables, spices, meats, delete items] 
        # # select foods from aisle and display prices and emojis 
        # # added to cart -> optional to add quantity
        # # at the end of aisles, go back to aisle choices
        # go_back
        # cart = []
    end

    def view_cart(cart)
        cart = []
        total = calculates total
        checkout
        go_back
    end

    def checkout
        show receipt
        exit
        go_back
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
