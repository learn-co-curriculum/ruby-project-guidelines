require 'pry'
require_relative '../config/environment'

def welcome 
title=Artii::Base.new(:font=> "cursive")
puts "Welcome to"
puts title.asciify("Command Theater")
end

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

def search
    movies = Movie.all.map {|movie| movie.title}
    prompt = TTY::Prompt.new
    movie_choice = prompt.select("What would you like to see?", movies)
    select_movie = Movie.find_by(title: movie_choice)
    puts "You selected #{movie_choice}!!! We love that one!"
    menu_options = prompt.select("What would you like to do next", ["Purchase Ticket", "Start Over"])
        if menu_options == "Purchase Ticket"
            puts "Here is your ticket! Excited yet?!"
            your_ticket = Ticket.create(theater_id: Theater.all.first.id, movie_id: select_movie.id, guest_id: Guest.all.first.id) 
            puts your_ticket
            puts "You're going to see #{your_ticket.movie.title} at #{your_ticket.theater.name}. "
        else 
            welcome
        end
    end

    def thanks
        puts "Thank you for your purchase! Commando Theater is b.y.o.b so feel free and WELCOME to bring your own refreshments. We cant wait to watch a movie with you!"
        prompt = TTY::Prompt.new
        thanks_choice = prompt.select("What would you like to do?", ["Rate Your Commando Expereince", "Start Over"])
            if thanks_choice == "Rate Your Commando Experience"
                rate= prompt.select("Give us a rating...", ["1", "2", "3", "4", "5"])
                if rate == "1"
                    puts "Thank you for your feedback."
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


welcome
login
search
thanks
