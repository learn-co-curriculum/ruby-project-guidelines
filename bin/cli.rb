require 'io/console'
require 'tty-prompt'
require 'pry'

class CLI

    attr_reader :prompt, :font
    attr_accessor :customer, :cart

    def main_menu
        system 'clear'
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
        else
            puts "Oops! This user name is already taken!"

            prompt = TTY::Prompt.new
            choices = ['🔹Sign-Up With Different User Name' , '🔹Login','🔹Exit'] 
            choice = prompt.select("\n ? \n",choices)
            if choice == '🔹Login'
                attempts = 0
                login(attempts)
            elsif choice == '🔹Sign-Up With Different User Name'
                signup
            elsif choice == '🔹Exit'
                exit
            end
        end
        # accept user_name & password -> update the table with new user if user name is unique else retry
        # go to shopping method - TBD
    end


    def login(attempts=0)
        attempts = 0
        system 'clear'
        if attempts < 3
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
        puts 'yay'
        prompt = TTY::Prompt.new
        choices = [ '🔹View Profile ', '🔹View Cart', '🔹Get To Shopping','🔹Checkout', '🔹Exit']
        system 'clear'
        choice = prompt.select("\n                                                                           🔹Welcome Back!!🔹 \n", choices)
        if choice == '🔹View Profile'
            profile
        elsif choice == '🔹View Cart'
            view_cart
        elsif choice == '🔹Get To Shopping'
            go_to_shopping
        elsif choice == '🔹Checkout'
            checkout
        elsif choice == '🔹Exit'
            exit
        end
    end


        #puts "yay"
        #choices = [ '🔹View Profile ', '🔹View Cart', '🔹Get To Shopping','🔹Checkout', '🔹Exit']



    def profile
        system 'clear'
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
            Customer.exists?(name: user_name, password: user_password)
                User.destroy_all(name: user_name)
                puts "Account Deleted. We hope to see you again soon!"
                exit
        elsif choice == '🔹Exit'
            exit
        end
        # #reset user_name & password

        # delete account
        # go_back 

        # go_back
        # delete account

    end

    def go_back
        #-> if else
    end

    def go_to_shopping(cart = [])
        system 'clear'
        prompt = TTY::Prompt.new
        choices = ['🔹Fruits', '🔹Vegetables', '🔹Spices','🔹View Cart', '🔹Checkout', '🔹Exit']
        choice = prompt.select("\n                                                                    Select an Aisle! \n", choices)
        if choice == '🔹Fruits'
            prompt = TTY::Prompt.new
            fruit_choices = Food.where(category: "Fruits").map{|fruit| fruit.name}
            prompt.multi_select("Use Space Bar |____| to select/unselect Fruits, and hit Enter when done.", fruit_choices)
            cart << fruit_choices 
            #puts "fruit added"
            go_to_shopping(cart.flatten)
            #puts "fruit added"
        elsif choice == '🔹Vegetables'
            prompt = TTY::Prompt.new
            vegetable_choices = Food.where(category: "Vegetables").map{|veg| veg.name}
            prompt.multi_select("Use Space Bar |____| to select/unselect Vegetables, and hit Enter when done.", vegetable_choices)
            cart << vegetable_choices
            #puts "Veg added"
            go_to_shopping(cart.flatten)
            #puts "Veg added"
        elsif choice == '🔹Spices'
            prompt = TTY::Prompt.new
            spice_choices = Food.where(category: "Spices").map{|spice| spice.name}
            prompt.multi_select("Use Space Bar |____| to select/unselect Spices, and hit Enter when done.", spice_choices)
            puts "Spice has been added to your cart"
            cart << spice_choices
            #puts "Spice has been added to your cart"
            go_to_shopping(cart.flatten)
            #puts "Spice has been added to your cart"
        elsif choice == '🔹View Cart'
            #puts "Cart is #{cart}"
            view_cart(cart.flatten)
        elsif choice == '🔹Checkout'
            checkout(cart)
        elsif choice == '🔹Exit' and cart.length == 0
            exit
        end
        # # choose from aisles choices = [fruits, vegetables, spices, meats, delete items] 
        # # select foods from aisle and display prices and emojis 
        # # added to cart -> optional to add quantity
        # # at the end of aisles, go back to aisle choices
        # go_back
        # cart = []
        #shopping
    end



    def view_cart(cart=[])
        if cart.length == 0
            puts "Your cart is empty"
            go_to_shopping
        else
            puts "Your cart has #{cart} inside."
            go_to_shopping
        end

    end

        # }
        # cart = []
        # total = calculates total
        # checkout
        # go_back


    def checkout(cart=[])
        prompt = TTY::Prompt.new
        choices = ['🔹Remove & Add', '🔹View Receipt', '🔹Exit']
        choice = prompt.select('\n \n', choices)
        if choice == '🔹Remove & Add'
            remove_and_add(cart)
        elsif choice == '🔹View Receipt'
            view_receipt
        elsif choice == '🔹Exit'
            exit
        end

        # customer.food.each{|food|
        #     puts "Fruits #{}"
        #     puts "Vegetables #{}"
        #     puts "Spices #{}"
        # have a price and food list and a grand total

        # show receipt
        #update cart/remove stuff if need be
        ## be able to select items out of the cart 
        # exit
        # go_back
    end

    def remove_and_add(cart)
        prompt = TTY::Prompt.new
        choices = ['🔹Remove', '🔹Add', '🔹Exit']
        choice = prompt.select('\n \n', choices)
        if choice == '🔹Remove'
            remove(cart)
        elsif choice == '🔹Add'
            go_to_shopping(cart)
        elsif choice == '🔹Exit'
            exit
        end

    end

    def remove(cart=[])
        trash = []
        puts 'YOU ARE NOW REMOVING ITEMS FROM A CART'
        prompt = TTY::Prompt.new
        choices = (cart)
        choice = prompt.multi_select('\n \n', choices)
        if choice == cart.index(0..10)
            trash << cart.index(0..10)
            trash.destroy_all
            checkout
        else 
            puts 'yay'
            checkout
        end


    end

    def take_out()

    end




    def view_receipt

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

# shopping_cart = CLI.new()
# # shopping_cart.main_menu
# shopping_cart.login(attempts = 0)

    # shopping_cart = CLI.new()
    # # shopping_cart.main_menu
    # shopping_cart.signup #(attempts = 0)


