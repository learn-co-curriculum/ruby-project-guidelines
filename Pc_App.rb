#----Welcomes The User----->

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




def run
    welcome_user
    user_input
end

run
