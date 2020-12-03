require 'io/console'

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
        puts "Enter user name"
        user_name = gets.chomp
        puts "Enter password"
        user_password = STDIN.noecho(&:gets).chomp
        if !Customer.exists?(name: user_name)
            Customer.create(name: user_name , password: user_password)
            puts "yay"
        else
            puts "Oops! This user name is already taken!"
            self.signup
        end
        # accept user_name & password -> update the table with new user if user name is unique else retry
        # go to shopping method - TBD
    end

    def login(attempts = 0)
        while attempts <= 3 do
            login_choices = ["Forgot User Name or Password?", "Exit"]
            puts "Enter user name"
            user_name = gets.chomp
            puts "Enter password"
            user_password = STDIN.noecho(&:gets).chomp
            if Customer.exists?(name: user_name, password: user_password)
                shopping
                return
            else
                puts "Invalid User Name or Password"
                attempts += 1
                login(attempts)
            end
        end
    end

        # After 3 attempts - prints max login attempts over.
        # Forgot password
        # gets user_name & password -> check if password matches user_name in table else 1. Error Msg 2. Exit 3. Re-login 4. Reset Password -> Signup
        # shopping


    def shopping
        puts "yay"
        #choices = [ '🔹View Profile ', '🔹View Cart', '🔹Get To Shopping','🔹Checkout', '🔹Exit']
    end

    def profile
        # #reset user_name & password
        # go_back 
    end

    def go_back
        #-> if else
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
        # cart = []
        # total = calculates total
        # checkout
        # go_back
    end

    def checkout
        # show receipt
        # exit
        # go_back
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

shopping_cart = CLI.new()
# shopping_cart.main_menu
shopping_cart.login(attempts = 0)