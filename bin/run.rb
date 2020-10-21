require_relative '../config/environment'

def welcome
    while true
        loggedin = false
        passenger = nil
        while !loggedin
            puts "Welcome to Flight Booker. Select the action you want to take."
            puts "  1. Login"
            puts "  2. Sign up"
            puts "  3. Exit"
            answer = gets.strip
            if answer == "1"
                passenger = login
                while passenger == nil
                    puts "Login failed. Try again"
                    passenger = login
                    # TODO: make it end somehow
                end
                loggedin = true
            elsif answer == "2"
                signup
            elsif answer == "3"
                puts "Goodbye."
                exit
            else
                puts "Unknown command. Try again."
            end
        end

        while loggedin
            puts "Hello #{passenger.name}. Why are you here?"
            puts "  1. View/Add Balance"
            puts "  2. Find and Book flights"
            puts "  3. Manage My Tickets"
            puts "  4. Logout"

            answer = gets.strip
            if answer == "1"
                puts "Your current balance is $#{passenger.balance}."
                puts "How much do you want to add to your balance?"
                to_add = gets.to_i
                passenger.add_money_to_account(to_add)
                puts "Thank you. Your new balance is $#{passenger.balance}."
            elsif answer == "2"
                puts "Where are you"
                origin = gets.strip
                puts "Where do you wanna go?"
                destination = gets.strip
                #TODO: Might wanna consider changing the question below to be more like a sequence of year? -> month? -> day?
                puts "When?"
                departure = gets.strip.to_date
                # FIXME: This thing can return nothing. We shouldn't be asking which one do you want when this happens because that gets stuck in an infinite loop...... HA HA HA 
                flights = SearchedFlight.find_and_print_flight(origin, destination, departure)
                puts "Which one do you want"
                flight_index = gets.strip.to_i - 1  # humans don't zero-index :)
                
                # some err handling
                while flight_index >= flights.length || flight_index < 0
                    puts "That doesn't seem like a valid number. Try again."
                    flight_index = gets.strip.to_i
                end
                
                chosen_searched_flight = flights[flight_index]
                # book that flight for this person
                puts "Ok.... So you want to book this flight for #{chosen_searched_flight.price}. Is that right?"
                if gets.strip == "yes"
                    if passenger.balance < chosen_searched_flight.price
                        puts "Insufficient balance. Purchase denied."
                        next
                    end
                    flight = Flight.find_matching_flight(chosen_searched_flight)
                    if flight == nil
                        flight = Flight.create_from_searchedflight(chosen_searched_flight)
                    end
                    ticket = Ticket.create({passenger_id: passenger.id, flight_id: flight.id, price: chosen_searched_flight.price})
                    passenger.deduct_money_from_account(chosen_searched_flight.price)
                else
                    puts "No. Goodbye" # TODO: 
                end
            elsif answer == "3"
                all_tickets = Ticket.where(:passenger_id => passenger.id)
                num = 1
                puts "Here are your tickets."
                puts "Ticket #\tOrigin\t\tDestination\tDeparture Date"
                # FIXME: this can return nothing! gracefully handle that
                all_tickets.each {|t| 
                    # Rodrigo: Add the carrier info here
                    puts "  #{num}\t#{t.flight.origin}\t#{t.flight.destination}\t#{t.flight.departure}"
                    # Marisa: Add features
                    # 1. Sort by 
                    # 2. Filter for a specific destination.
                    num += 1
                }
                # TODO: Add option to cancel ticket
            elsif answer == "4"
                puts "Ok. Bye!"
                loggedin = false
            else
                puts "Unknown command. Try again."
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
    existing_pass = Passenger.find_by(username: candidate_username)
    while existing_pass != nil
        puts "This username is taken. Enter in another username: "
        candidate_username = gets.strip
        existing_pass = Passenger.find_by(username: candidate_username)
    end
    
    puts "Password: "
    pw = gets.strip

    puts "Enter your name: "
    name = gets.strip

    p1 = Passenger.create
    p1.name = name 
    p1.username = candidate_username
    p1.password = pw
    p1.balance = 0.00
    p1.save
end
    

welcome