require 'pry'
require_relative '../config/environment'


#####Deliverables for Program#####
#have a login prompt
#be able to save info 



#  binding.pry
puts "HELLO WORLD"



def login
    guests = Guest.all.map {|guest| guest.name}
    prompt = TTY::Prompt.new
    login_choice = prompt.select("What would you like to do?", ["Login", "Sign Up", "continue as a guest"])
    if (login_choice == "Login")
        current_username = prompt.ask("What is your username?")
        current_password = prompt.ask("What is your password?")
        if guests.include?(current_username) && Guest.all.find_by(password: current_password)
            puts "Enjoy you movie!"
        else 
            puts "Incorrect username or password"
            exit!
        end
    end
end

# def signup
#     guests = Guest.all.map {|guest| guest.name}
#     prompt = TTY::Prompt.new
#     signup_choice = prompt.select("create username?", ["Login", "Sign Up", "continue as a guest"])
#     if (signup_choice == "Signup")
#         current_username = prompt.ask("What is your username?")
#         current_password = prompt.ask("What is your password?")
#         if guests.include?(current_username) && Guest.all.find_by(password: current_password)
#             puts "Enjoy you movie!"
#         else 
#             puts "Incorrect username or password"
#             exit!
#         end
#     end
# end


login
