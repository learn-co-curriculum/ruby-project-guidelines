class NameSearch

    def results
        puts "Please enter the event or artist you would like to see:"
        user_input = STDIN.gets.chomp.downcase.split(" ")
        events = []
        user_input.each do |word|
            found_events = Event.all.select {|event|event.attraction_name.split.any?(word.capitalize) || event.attraction_name.split.any?(word)}.uniq
            found_events.each {|e| events << e} 
        end
        events.uniq
    end

end