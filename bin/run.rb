require_relative '../config/environment'
require 'pry'
def welcome_user
    puts "*******************************"
    puts "       Welcome To Our          "
    puts "        PC Store App           "
    puts "*******************************"
 end
 
 #-------First/Previous user login/sign_up-------------------->
 def user_input
     puts "Sign-in with your Username."
     gets.chomp
 end

 def item_input
    puts "What are you looking for?"
    gets.chomp
 end

 def choose_input
    puts "Are you sure this is what you need? (type yes/no)"
    gets.chomp
 end

 def choose_item
    gets.chomp
 end
 
 #-----Runs our code----->
 def run
     welcome_user
     create_new_user_if_not_exist
     search_for
     you_want_it?
     select_or_not?
     check_out?
     clear_purchase_after_checkout
 end

 #------Method lets us know if user exists or not------>
 def create_new_user_if_not_exist
    $username = user_input
    namelist=[]
    User.all.each do |m|
        namelist.push(m.name)
    end
    if namelist.include? $username
            puts "Welcome back. What are you looking for?"
    else
        newuser=User.create(name: $username)
        puts "What are you looking for?"
    end
 end

 #---show the list of available Items--->
 def search_for
    item_brand=item_input
    Item.search_by_name(item_brand)  
 end

 #---Choose item--->
 def you_want_it?
    puts "Is there anything you like? Y/N"
 end
 
 def select_or_not?
    choose_op=choose_input
    if (choose_op =="Y")
        choose_your_item
    else
        puts "Try Aonther search"
    end
end
def choose_your_item
   puts "Please choose the item name"
   add_to_cart
end

 #---Making purchase-->
 def add_to_cart
    intem_name=choose_item
    itemchoosed = Item.all.find_by(name:intem_name)
    newuser= User.all.find_by(name:$username)
    newpurchase= Purchase.create(user_id: newuser.id, item_id: itemchoosed.id)

 end

 def check_out?
    puts "Do you want to check out? Y/N"
    choose_op=choose_input
    newuser= User.all.find_by(name:$username)
    if (choose_op =="Y")
        User.total(newuser)
    else
        choose_your_item
        check_out?
    end
 end

 def clear_purchase_after_checkout
    Purchase.destroy_all
 end

#---Make/Write a Review-->
#  def write_a_review

#  end



 #-----Runs our code----->
 def run
     welcome_user
     username = user_input
     item_name=item_input
     choose_op=choose_input
    #  create_new_user_if_not_exist
    #  search_for
    #  you_want_it
 end


run
#--We can do-->

# Review.see_my_review("Yordin")
