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


    
    # ticket_purchase = Ticket.create(theater_id: commando.id , movie_id: m11.id, guest_id: g5.id)
    # ticket_purchase


        
    





#####Deliverables for Program#####
#have a login prompt
#be able to save info 
# def title 
#     fancy schmancy title 
# end

# def login 
#     kdajfdkljfadlkjfads
# end

# def search
#     where they say if they wanna view all movies or by genre
# end

# def movie choice 
#     pick a showtime 
# end

# def purchase
#     purchase movie choice at showtime choice
# end

# def confirmation
#     would you like to cancel 
# end

# def rating 
#     ask to leave rating
# end

# def end goodbye
#     thanks for purchasing . see you at showtime
# end

# END








