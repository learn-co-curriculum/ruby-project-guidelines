def welcome
    puts "The Dinner Bell's Ringing! Let's Eat!"
end

def get_food_order
    puts "What do you have a taste for?"
    STDIN.gets.chomp.downcase #takes in the user's food request & downcases it.
    last_call #creates a loop for those who wish to change their food choice
end

def last_call
    puts "Are you sure that's what you want? (y/n)" #prompts the user to make a food choice
    options = STDIN.gets.chomp.downcase #takes a response from the user 
    if options == "y" #if they say y, yes, print message below
        puts "Thank you for using Let's Eat!" 
    elsif options == "n" #if they say n, no, loop back to getting the food order 
        get_food_order #take another food order
    else #if they put anything besides y or n prints message below and loops this method
       puts "Sorry, that was not a valid answer. Please press y for yes or n for no."
       last_call #loop this method
    end 
end