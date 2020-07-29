require_relative '../config/environment'

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
     clear_cart_after_checkout
 end

 #------Method lets us know if user exists or not------>
 def create_new_user_if_not_exist
      puts "Sign-in with your Username."
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
   item_brand = user_input
   Item.search_by_name(item_brand)  
 end
 
 def select_or_not?
   puts "Is there anything you like? Y/N"
   choose_op=user_input
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

 #---Adding to cart-->
 def add_to_cart
   item_name=user_input
   itemchoosed = Item.all.find_by(name:item_name)
   newuser= User.all.find_by(name:$username)
   newcart= Cart.create(user_id: newuser.id, item_id: itemchoosed.id)
   newtran=Cart.make_my_transaction(newcart)
 end

#---Checking out-->
 def check_out?
    puts "Do you want to check out? Y/N"
    check_op=user_input
    newuser= User.all.find_by(name:$username)
    if (check_op =="Y")
        User.total(newuser)
        #MyTransaction.new=(cart_id:newcart.id, total_amount: )
    else
        choose_your_item
        check_out?
    end
 end

 def clear_cart_after_checkout
    Cart.destroy_all
 end

#---Make/Write a Review-->
#  def write_a_review
# Review.see_my_review("Yordin")
#  end
run