require_relative '../config/environment'

def welcome
    while true
        loggedin = false
        passenger = nil
        while !loggedin
            puts "Welcome to Flight Booker. Select the action you want to take."
            puts "  1. Login"
            puts "  2. Sign up"
            answer = gets.strip
            if answer == "1"
                passenger = login
                while passenger == nil
                    puts "Login failed. Try again"
                    passenger = login
                end
                loggedin = true
            elsif answer == "2"
                signup
            else
                puts "Unknown command. Try again."
            end
        end

        while loggedin
            puts "Hello #{passenger.name} Why are you here?"
            puts "  1. View/Add balance"
            puts "  2. Find and Book flights"
            puts "  3. Cancel my trip"
            puts "  4. Logout"

            answer = gets.strip
            if answer == "1"
                puts "Your current balance is $#{passenger.balance}."
                puts "How much do you want to add to your balance?"
                to_add = gets.to_i
                passenger.balance += to_add
                passenger.save
                puts "Thank you. Your new balance is $#{passenger.balance}."
            elsif answer == "2"
                puts "You can't do that either"
            elsif answer == "3"
                puts "You can't do that either..."
            elsif answer == "4"
                puts "Ok. Bye!"
                loggedin = false
            else
                puts "Why not choose something that actually exists?"
            end
        end
    end
end

# A method for handling user interaction to log in.
def login
    puts "Enter your username: "
    user_id = gets.strip
    puts "Enter your password: " 
    user_pw = gets.strip  # TODO: Is there a way to get user input string without showing it on the console? 
    passenger = Passenger.login(user_id, user_pw)
    return passenger
end 

# A method for handling user interaction to sign up.
# TODO: Maybe move some of the signup logic here to passenger class itself.
def signup
    puts "Enter a username: "
    candidate_username = gets.strip
    existing_pass = Passenger.find_by username: candidate_username
    while existing_pass != nil
        puts "This username is taken. Enter in another username: "
        candidate_username = gets.strip
        existing_pass = Passenger.find_by username: candidate_username
    end
    
    puts "Password: "
    pw = gets.strip

    puts "Enter your name: "
    name = gets.strip

    p1 = Passenger.create
    p1.name = name 
    p1.username = candidate_username
    p1.password = pw
    p1.balance = 0.0
    p1.save
end
    

welcome