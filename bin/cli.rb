require 'io/console'
require 'tty-prompt'
# require 'pry'

class CLI

    attr_reader :prompt, :font
    attr_accessor :customer

    def main_menu
        system 'clear'
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
            attempts = 0
            login(attempts)
        elsif choice == '🔹Signup'
            signup
        elsif choice == '🔹Exit'
            exit
        end
    end

    def signup
        system 'clear'
        puts "Enter user name"
        user_name = gets.chomp
        puts "Enter password"
        user_password = STDIN.noecho(&:gets).chomp
        if !Customer.exists?(name: user_name)
            Customer.create(name: user_name , password: user_password)
            if tried_user_names.include? user_name
                puts "You already tried this user name!"
            end
        else
            puts "Oops! This user name is already taken!"
            @prompt = TTY::Prompt.new
            prompt = TTY::Prompt.new
            choices = ['🔹Sign-Up With Different User Name' , '🔹Login','🔹Exit'] 
            choice = prompt.select("\n ? \n",choices)
            if choice == '🔹Login'
                attempts = 0
                login(attempts)
            elsif choice == '🔹Sign-Up With Different User Name'
                signup
            else choice == '🔹Exit'
                exit
            end
        end
        # accept user_name & password -> update the table with new user if user name is unique else retry
        # go to shopping method - TBD
    end


    def login(attempts=0)
        attempts = 0
        while attempts <= 3 do
            #login_choices = ["Forgot User Name or Password?", "Exit"]
    def login(attempts)
        system 'clear'
        if attempts < 3
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
                @prompt = TTY::Prompt.new
                prompt = TTY::Prompt.new
                choices = ['🔹Re-Login' ,'🔹Forgot User Name/Password', '🔹Exit'] 
                choice = prompt.select("\n ? \n",choices)
                if choice == '🔹Re-Login'
                    login(attempts)
                elsif choice == '🔹Forgot User Name/Password'
                    puts "Sign-Up"
                    signup
                elsif choice == '🔹Exit'
                    exit
                end
            end
        else
            puts "Maximum number of login attempts exceeded. Try again later!"
        end
    end

        # After 3 attempts - prints max login attempts over -> Advanced -> Do a timestamp-based entry
        # Forgot password
        # gets user_name & password -> check if password matches user_name in table else 1. Error Msg 2. Exit 3. Re-login 4. Reset Password -> Signup
        # shopping


    def shopping
<<<<<<< HEAD
<<<<<<< HEAD
        prompt = TTY::Prompt.new
        choices = [ '🔹View Profile ', '🔹View Cart', '🔹Get To Shopping','🔹Checkout', '🔹Exit']
        choice = prompt.select(choices)
        
        if choice == '🔹View Profile'
            view_profile
=======
        puts 'yay'
        @prompt = TTY::Prompt.new
        prompt = TTY::Prompt.new
        choices = [ '🔹View Profile ', '🔹View Cart', '🔹Get To Shopping','🔹Checkout', '🔹Exit']
        system 'clear'
        choice = prompt.select("\n                                                                           🔹Welcome Back!!🔹 \n", choices)
        if choice == '🔹View Profile'
            profile
>>>>>>> Dan
        elsif choice == '🔹View Cart'
            view_cart
        elsif choice == '🔹Get To Shopping'
            go_to_shopping
        elsif choice == '🔹Checkout'
            checkout
        elsif choice == '🔹Exit'
            exit
        end
<<<<<<< HEAD
=======
        puts "yay"
        #choices = [ '🔹View Profile ', '🔹View Cart', '🔹Get To Shopping','🔹Checkout', '🔹Exit']
>>>>>>> Dan
=======
>>>>>>> Dan
    end


    def profile
        system 'clear'
        @prompt = TTY::Prompt.new
        prompt = TTY::Prompt.new
        choices = ['🔹Reset User Name' ,'🔹Reset Password', '🔹Delete Account', '🔹Exit'] 
        choice = prompt.select("\n ? \n",choices)
        if choice == '🔹Reset User Name'
            puts "Enter new user name"
            user_name = gets.chomp
            Customer.update_attribute(name, user_name)
        elsif choice == '🔹Reset Password'
            puts "Enter new password"
            user_password = STDIN.noecho(&:gets).chomp
            Customer.update_attribute(password, user_password)
        elsif choice == '🔹Delete Account'
            puts "Enter your user name"
            user_name = gets.chomp
            puts "Enter your password"
            user_password = STDIN.noecho(&:gets).chomp
            Customer.exists?(name: user_name, password: user_password):
                User.destroy_all(name: user_name)
                puts "Account Deleted. We hope to see you again soon!"
                exit
        else choice == '🔹Exit'
            exit
        end
        # #reset user_name & password
<<<<<<< HEAD
        # delete account
        # go_back 
=======
        # go_back
        # delete account
>>>>>>> 57fedbb23024b86457d237ff4d25409b5c174ec2
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
        shopping
    end

    def view_cart(cart)
        customer.food.each{|food|
            puts "Fruits #{}"
            puts "Vegetables #{}"
            puts "Spices #{}"

        }
        # cart = []
        # total = calculates total
        # checkout
        # go_back
    end

    def checkout
        # show receipt
        #update cart/remove stuff if need be
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

    


    # def opener 
    #     puts "\n 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 \n "
    # end




<<<<<<< HEAD
<<<<<<< HEAD
=======
    def opener 
        puts "\n 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 \n "
    end
end

<<<<<<< HEAD
shopping_cart = CLI.new()
# shopping_cart.main_menu
shopping_cart.login(attempts = 0)
>>>>>>> Dan
=======
    # shopping_cart = CLI.new()
    # # shopping_cart.main_menu
    # shopping_cart.signup #(attempts = 0)

end
>>>>>>> Dan
=======
# shopping_cart = CLI.new()
# # shopping_cart.main_menu
# shopping_cart.login(attempts = 0)
>>>>>>> 57fedbb23024b86457d237ff4d25409b5c174ec2
