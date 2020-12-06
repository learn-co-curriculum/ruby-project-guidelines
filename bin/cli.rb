require 'io/console'
require 'tty-prompt'
require 'pry'
require 'colorize'
require 'lolize'
require "tty-table"

class CLI

    attr_reader :prompt, :font
    attr_accessor :customer, :cart

    def main_menu
        system 'clear'
        @font = TTY::Font.new
        @pastel = Pastel.new
        opener
        puts @pastel.cyan(@font.write("                                   Shopping        Cart !!"))
        puts "                             
        dMo                                     
        yMN`                                    
        :MM+                                    
         mMNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNh
         +MMs+++++++++++++++++++++++++++++++sMM+
         `MMy                               yMM`
          yMN`                             `NMy 
          :MM+                             /MM: 
           mMm-----------------------------dMm  
           +MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo  
           `NMy``````````````````````````````   
            yMN`                                
            -MMdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh+ 
             +yyyMMMMMMMdyyyyyyyyMMMMMMMdyyyys/ 
               `mMm+:/hMM:     `mMm+:/hMM/      
               /MM:   `NMy     :MM/    NMh      
               `mMm+:/hMN:     `dMNo:/hMM:      
                `+dNMNms.        +hNMMms. 
                \n".lines.map { |line| line.center(100) }.join("").cyan
        opener
        prompt = TTY::Prompt.new
        choices = ['🔹Login'.green ,'🔹Signup'.yellow, '🔹Exit'.red] # '🔹Update Name Info', '🔹Delete Account'
        choice = prompt.select("\n                                                      🔹Welcome to Shopping Cart, please make a selection🔹\n", choices) # do not use multi_select it leaves an octogon symble 

        if choice == '🔹Login'.green
            attempts = 0
            login(attempts)
        elsif choice == '🔹Signup'.yellow
            signup
        elsif choice == '🔹Exit'.red
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
            puts "Thank you for joining us for a fantastic shopping experience"
            sleep(1)
            shopping
        else
            puts "Oops! This user name is already taken!"

            prompt = TTY::Prompt.new
            choices = ['🔹Sign-Up With Different User Name'.green , '🔹Login'.yellow,'🔹Exit'.red] 
            choice = prompt.select("\n ? \n",choices)
            if choice == '🔹Login'.yellow
                attempts = 0
                login(attempts)
            elsif choice == '🔹Sign-Up With Different User Name'.green
                signup
            elsif choice == '🔹Exit'.red
                exit
            end
        end
        # accept user_name & password -> update the table with new user if user name is unique else retry
        # go to shopping method - TBD
    end


    def login(attempts=0)
        attempts = 0
        system 'clear'
        puts"
                                                  
                                                  
                   .-/+oooo+/-.                   
              `:sdNMMNmddddmNMMNds:`              
            :yNMms/-`        `-/smMNy:            
          /mMmo.                  .omMm/          
        -dMm/        -oyhhyo-        /mMd-        
       /NMy`       .dMMMMMMMMd.       `yMN/       
      /MM+        `NMMMMMMMMMMN`        +MM/      
     .NMs         -MMMMMMMMMMMM-         sMN.     
     sMN`          dMMMMMMMMMMd          `NMs     
     mMy           `oNMMMMMMNo`           yMm     
     MMo              -+oo+-              oMM     
     mMy             `.----.`             yMm     
     sMN`       -ohmMMMMMMMMMMmho-       `NMs     
     .NMs     :dMMMMMMMMMMMMMMMMMMd:     sMN.     
      /MMo   .MMMMMMMMMMMMMMMMMMMMMM.   oMM/      
       /NMy` :MMMMMMMMMMMMMMMMMMMMMM: `yMN/       
        .dMN+:MMMMMMMMMMMMMMMMMMMMMM:+NMd.        
          /mMNMMMMMMMMMMMMMMMMMMMMMMNMm/          
            :yNMMMMMMMMMMMMMMMMMMMMNy:            
              `:sdNMMMMMMMMMMMMNds:`              
                   .-/+oooo+/-.          \n    ".lines.map { |line| line.center(100) }.join("").magenta.bold
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
        choices = [ '🔹View Profile'.blue, '🔹View Cart'.green, '🔹Get To Shopping'.yellow,'🔹Checkout'.white, '🔹Exit'.red]
        system 'clear'
        choice = prompt.select("\n                                                                           🔹Welcome Back!!🔹 \n", choices)
        if choice == '🔹View Profile'.blue
            profile
        elsif choice == '🔹View Cart'.green
            view_cart
        elsif choice == '🔹Get To Shopping'.yellow
            go_to_shopping
        elsif choice == '🔹Checkout'.white
            checkout
        elsif choice == '🔹Exit'.red
            exit
        end
    end


    def profile
        system 'clear'
        puts"
                                                  
                                                  
                   .-/+oooo+/-.                   
              `:sdNMMNmddddmNMMNds:`              
            :yNMms/-`        `-/smMNy:            
          /mMmo.                  .omMm/          
        -dMm/        -oyhhyo-        /mMd-        
       /NMy`       .dMMMMMMMMd.       `yMN/       
      /MM+        `NMMMMMMMMMMN`        +MM/      
     .NMs         -MMMMMMMMMMMM-         sMN.     
     sMN`          dMMMMMMMMMMd          `NMs     
     mMy           `oNMMMMMMNo`           yMm     
     MMo              -+oo+-              oMM     
     mMy             `.----.`             yMm     
     sMN`       -ohmMMMMMMMMMMmho-       `NMs     
     .NMs     :dMMMMMMMMMMMMMMMMMMd:     sMN.     
      /MMo   .MMMMMMMMMMMMMMMMMMMMMM.   oMM/      
       /NMy` :MMMMMMMMMMMMMMMMMMMMMM: `yMN/       
        .dMN+:MMMMMMMMMMMMMMMMMMMMMM:+NMd.        
          /mMNMMMMMMMMMMMMMMMMMMMMMMNMm/          
            :yNMMMMMMMMMMMMMMMMMMMMNy:            
              `:sdNMMMMMMMMMMMMNds:`              
                   .-/+oooo+/-.           \n  ".lines.map { |line| line.center(100) }.join("").magenta.bold
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
    end


    def go_to_shopping(cart = [])
        system 'clear'
        colorizer = Lolize::Colorizer.new
        colorizer.write "
        `oddddo`                     
        `oddssssddo`                   
       -mym`    `mym-                  
      :dhd.      .dhd:                 
     :dhd.        .dhd:                
    `odhs          shdo`               
    /mhd            dhm/               
   :hdh-            -hhh:              
...........omdd..............ddmo...........   
mhhhhhhyssssssssssssssssssssssssssssyhhhhhhm   
msoooooo/::::::::::::::::::::::::::/oooooosm   
msoooooo+::::::::::::::::::::::::::+oooooosm   
+hsoooosss+++:::::::::::::::o/:::::+ooooosh+   
myooooyyo+ohoo/ooo/ooo/ooo/o/+oo++sysoooym    
myoooossysoyoy+hsh/dsd/hsh+y+yososhhyoooym    
ohsooos+///////////d//:h+////////+shyoosho    
dyoooo+:::::::::://::://::::::::/+ssooyd     
dyoooo/::::::+ysy::::::::::::::::/ooooyd     
-hyoo+:::::::+hso/+sy/:ysy+:::::::+ooyh-     
dyoo+:::::::+ysy/ysys/ysh+:::::::+ooyd      
yyso+:::::::::::::::::osy+:::::::+osyy      
hyo+::::::::::::::::::::::::::::+oyh       
hyo+::::::::::::::::::::::::::::+oyh       
:yy+////++++++++++++++++++++////+yy:       
ymddddyooooooooooooooooooooyddddmy       \n ".lines.map { |line| line.center(100) }.join("")
        prompt = TTY::Prompt.new
        choices = ['🔹Fruits'.blue, '🔹Vegetables'.green, '🔹Spices','🔹View Cart'.yellow, '🔹Checkout'.magenta, '🔹Exit'.red]
        choice = prompt.select("\n                                                                    Select an Aisle! \n", choices)
        if choice == '🔹Fruits'.blue
            prompt = TTY::Prompt.new
            fruit_choices = Food.where(category: "Fruits").map{|fruit| fruit.name}
            fruits = prompt.multi_select("Use Space Bar |____| to select/unselect Fruits, and hit Enter when done.", fruit_choices)
            cart << fruits
            puts "\n\n #{fruits.join(",")} has/have been added to your cart"
            sleep(1)
            go_to_shopping(cart.flatten)
        elsif choice == '🔹Vegetables'.green
            prompt = TTY::Prompt.new
            vegetable_choices = Food.where(category: "Vegetables").map{|veg| veg.name}
            vegetables = prompt.multi_select("Use Space Bar |____| to select/unselect Vegetables, and hit Enter when done.", vegetable_choices)
            puts "\n\n #{vegetables.join(",")} has/have been added to your cart"
            sleep(1)
            cart << vegetables
            go_to_shopping(cart.flatten)
        elsif choice == '🔹Spices'
            prompt = TTY::Prompt.new
            spice_choices = Food.where(category: "Spices").map{|spice| spice.name}
            spices = prompt.multi_select("Use Space Bar |____| to select/unselect Spices, and hit Enter when done.", spice_choices)
            puts "\n\n #{spices.join(",")} has/have been added to your cart"
            sleep(1)
            cart << spices
            go_to_shopping(cart.flatten)
        elsif choice == '🔹View Cart'.yellow
            view_cart(cart.flatten)
        elsif choice == '🔹Checkout'.magenta
            checkout(cart)
        elsif choice == '🔹Exit'.red and cart.length == 0
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
            puts "Your cart is empty. Go back to shopping.\n Re-directing back to shopping"
            sleep(1)
            go_to_shopping(cart)
        else
            puts "Your cart has #{cart} inside.\n Re-directing back to shopping"
            sleep(5)
            go_to_shopping(cart)
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
        choice = prompt.select('\n Select an option \n', choices)
        if choice == '🔹Remove & Add'
            remove_and_add
        elsif choice == '🔹View Receipt'
            view_receipt(cart)
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

    def remove_and_add
        
    end

    def view_receipt(cart=[])
        categories = []
        cart.uniq.each do |food_item|
            categories << Food.find_by(name: food_item).category
        end
        prices = []
        cart.uniq.each do |food_item|
            prices << Food.find_by(name: food_item).price
        end
        quantities = cart.uniq.each.map{|ele| cart.count(ele)}
        total = []
        iter = 0
        while iter < cart.uniq.length do
            total << prices[iter]*quantities[iter]
            iter += 1
        end 
        table_array = []
        index = 0
        while index < cart.length do
            table_array << [cart.uniq[index],categories[index],prices[index],quantities[index],total[index]]
            index += 1
        end
        table = TTY::Table.new(%w[Item Category Price/Item Quantity Total],
            table_array)
        colorizer = Lolize::Colorizer.new
        colorizer.write table.render(:ascii, alignments: %i[center]) do |renderer|
        renderer.border.separator = :each_row
        end

        colorizer.write "\n\n Thank you for shopping with us.\n Your grand total is = #{total.sum}\n\n"
    
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



