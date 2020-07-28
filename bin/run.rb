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
 
 

 #------Method lets us know if user exists or not------>
#  def create_new_user_if_not_exist
#     namelist=[]
#     User.all.each do |m|
#         namelist.push(m.name)
#         binding.pry
#     end
#     if namelist.include? $username
#         puts "Welcome back. What are you looking for?"
#     else
#         newuser=User.create(name: $username)
#             puts "What are you looking for?"
#     end
#  end

 #---show the list of available Items--->
#  def search_for
#     Item.search_by_name($item_name)  
#  end

 #---Choose item--->
#  def you_want_it
#     puts "Is there anything you like? Y/N"
#     if $choose_op == Y
#         make_a_purchase(item2)
#     else
#         puts "Aonther search"
#     end
# end

 #---Making purchase-->
#  def make_a_purchase
#     newpurchase= Purchase.new(username.id,item2.id)
#     User.total($username )
#  end

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
