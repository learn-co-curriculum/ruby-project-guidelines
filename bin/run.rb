require_relative '../config/environment'

#puts "HELLO WORLD"

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
 
 #-----Runs our code----->
 def run
     welcome_user
     $username = user_input
     create_new_user_if_not_exist
 end

 #------Method lets us know if user exists or not------>
 def create_new_user_if_not_exist
    namelist=[]
    User.all.each do |m|
        namelist.push(m.name)
    end
    if namelist.include? $username
            puts "Welcome back."
    else
        newuser=User.create(name: $username)
        puts "What are you looking for?"
    end
 end

 #---Making purchase-->
 def make_a_purchase(username)
    newpurchase= Purchase.new(username.id,item2.id)
 end
 
run



# Item.search_by_name('Dell')   
# User.total("Yehong")
# Review.see_my_review("Yordin")
