require 'pry'
require_relative '../config/environment'

def welcome 
title=Artii::Base.new(:font=> "cursive")
puts "Welcome to"
puts title.asciify("Command Theater")
end

def search
    movies = Movie.all.map {|movie| movie.title}
    prompt = TTY::Prompt.new
    movie_choice = prompt.select("What would you like to see?", movies)
    select_movie = Movie.find_by(title: movie_choice)
    puts "You selected #{movie_choice}!!! We love that one"
    menu_options = prompt.select("What would you like to do next", ["Purchase Ticket", "Start Over"])
        if menu_options == "Purchase Ticket"
            puts "Here is your ticket"
            your_ticket = Ticket.create(theater_id: Theater.all.first.id, movie_id: select_movie.id, guest_id: Guest.all.first.id) 
        else 
            welcome
        end
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
welcome
search
