require_relative '../config/environment'
require "tty-prompt"

def welcome_user
    puts "*******************************"
    puts "       Welcome To Our          "
    puts "        PC Store App           "
    puts "*******************************"
 end
 
 #-------Get user input-------------------->
 def user_input
     gets.chomp
 end

 #-----Runs our code----->
 def run
     welcome_user
     create_new_user_if_not_exist
     search_for
     select_or_not?
     check_out?
     see_your_history?
     clear_cart_after_checkout
 end

 #------Method lets us know if user exists or not------>
 def create_new_user_if_not_exist
      puts "                           "
      puts "Sign-in with your Username."
      $username = user_input
      # $username= TTY::Prompt.new
      # $username.ask("Sign-in with your Username.")
      namelist=[]
   User.all.each do |m|
      namelist.push(m.name)
    end
    if namelist.include? $username
         puts "Welcome back. What are you looking for?"
         puts "                           "
         show_list
    else
        newuser=User.create(name: $username)
        puts "What are you looking for?"
        puts "                           "
        show_list
    end
 end

 def show_list
   puts "____________Inventory_____________"   
   Item.all.each do|m|
      puts "* #{m.name}-#{m.brand}- #{m.cost}-#{m.description}"
   end
   puts "__________________________________"
end

 #---show the list of available Items--->
 def search_for
   item_brand = user_input
   # item_brand =TTY::Prompt.new
   puts "__________________________________"
   Item.search_by_name(item_brand)  
 end
 
 def select_or_not?
   puts "__________________________________"
   puts "Is there anything you like? Y/N"
   choose_op=user_input
   # choose_op=TTY::Prompt.new
   # choose_op.yes?("Is there anything you like?")
   if (choose_op =="Y")
      choose_your_item
   else
      puts "Try Aonther search"
      show_list
      select_or_not?
    end
end

def choose_your_item
   puts "Please choose the item name"
   add_to_cart
end

 #---Adding to cart-->
 def add_to_cart
   item_name=user_input
   $itemchoosed = Item.all.find_by(name:item_name)
   newuser= User.all.find_by(name:$username)
   newcart= Cart.create(user_id: newuser.id, item_id: $itemchoosed.id)
   newtran=Cart.make_my_transaction(newcart)
 end

#---Checking out-->
 def check_out?
    puts "Do you want to check out? Y/N"
    check_op=user_input
    newuser= User.all.find_by(name:$username)
    if (check_op =="Y")
        puts "__________________________________"
        User.total(newuser)
        Cart.all.each do |m|
         puts "__________________________________"
        puts "How many stars you would like to give #{Item.find_by(id:m.item_id).name}?"
        star_count=user_input
        newreview=Review.create(star:star_count, user_id:newuser.id, item_id:m.item_id)
        end
    else
        choose_your_item
        check_out?
    end
 end
 #---Checking out history-->
   def see_your_history?
      puts "Do you want to see all your review? Y/N"
      choose_op=user_input
      if (choose_op=="Y")
         puts Review.see_my_review($username)
         puts "                            "
         puts "Do you want to see all your transaction? Y/N"
         choose_op=user_input
         if (choose_op=="Y")
         puts Mytransaction.my_history($username)
         end
      else
         puts "                            "
         puts "Do you want to see all your transaction? Y/N"
         choose_op=user_input
         if (choose_op=="Y")
         puts Mytransaction.my_history($username) 
         end  
      end  
   end
 #---Clear cart & End-->
 def clear_cart_after_checkout
   puts "                               "
   puts "************Bye Bye************"
   puts "                               "
    Cart.destroy_all
 end

 run

 User.destroy_all
 Review.destroy_all
 Mytransaction.destroy_all


