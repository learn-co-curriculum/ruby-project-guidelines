require_relative '../config/environment'
require "tty-prompt"
def welcome_user
    puts "*******************************"
    puts "       Welcome To Our          "
    puts "        PC Store App           "
    puts "*******************************"
 end
 
 #-----Runs our code----->
 def run
     welcome_user
     create_new_user_if_not_exist
     select_or_not?
     check_out?
     see_your_history?
     clear_cart_after_checkout
 end

 #------Method lets us know if user exists or not------>
 def create_new_user_if_not_exist
      puts "                           "
      prompt = TTY::Prompt.new
      $username = prompt.ask("Sign-in with your Username.")
      namelist=[]
      User.all.each do |m|
      namelist.push(m.name)
      end
      Item.show_list
   
    if namelist.include? $username
         puts "Welcome back."
         puts "                           "
         search_for
    else
        newuser=User.create(name: $username)
        search_for
    end
 end

 #---show the list of available Items--->
 def search_for
   prompt = TTY::Prompt.new
   item_brand=prompt.ask("What are you looking for?")
   Item.search_by_name(item_brand) 
 end
 
 def select_or_not?
   prompt = TTY::Prompt.new
   if prompt.yes?("Is there anything you like?")
      choose_your_item
   else
      puts "Try Aonther search"
      Item.show_list
      select_or_not?
    end
end

def choose_your_item
   choices = %w(Dell-1 Dell-2 Samsung-3 Dell-3 Dell-4 Dell-5) 
   prompt=TTY::Prompt.new
   item_name=prompt.select("Please choose the item name",choices)
   itemchoosed = Item.all.find_by(name:item_name)
   newuser= User.all.find_by(name:$username)
   newcart= Cart.create(user_id: newuser.id, item_id: itemchoosed.id)
   newtran=Cart.make_my_transaction(newcart)
 end

#---Checking out-->
 def check_out?
   prompt=TTY::Prompt.new
   if prompt.yes?("Do you want to check out?")
      newuser= User.all.find_by(name:$username)
      User.total(newuser)
      Cart.all.each do |m|
      puts "__________________________________"
      prompt=TTY::Prompt.new
      star_count=prompt.ask("How many stars you would like to give #{Item.find_by(id:m.item_id).name}?")
      newreview=Review.create(star:star_count, user_id:newuser.id, item_id:m.item_id)
      end
    else
        choose_your_item
        check_out?
    end
 end
 #---Checking out history-->
   def see_your_history?
      prompt=TTY::Prompt.new
      if prompt.yes?("Do you want to see all your review?")
         puts Review.see_my_review($username)
         prompt=TTY::Prompt.new
         if prompt.yes?("Do you want to see all your transaction?")
            puts Mytransaction.my_history($username)
         end
      else
         prompt=TTY::Prompt.new
         if prompt.yes?("Do you want to see all your transaction?")
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

#  User.destroy_all
#  Review.destroy_all
#  Mytransaction.destroy_all


