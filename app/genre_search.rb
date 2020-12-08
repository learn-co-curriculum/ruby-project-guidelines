class GenreSearch
    def numbered_types(events)
        i = 1
        numbered_types = {}
        event_types = events.map{|event| event.event_type}.uniq
        event_types.each do |type|
            if type == "Undefined"
                type = "Other"
                numbered_types[i] = type
            else 
                numbered_types[i] = type
            end 
        i += 1
        end 
        numbered_types
    end 

    def genre_results(type, events)
        if type == "Other"
            type = "Undefined"
        end 
        events_filtered_by_type = events.select {|event|event.event_type == type}
    end 

    def numbered_genres(events_filtered_by_type)
        i = 1
        numbered_genres = {}
        event_genres = events_filtered_by_type.map{|event| event.genre}.uniq
        event_genres.each do |genre|
            if genre == nil || genre == "Undefined"
                genre = "Other"
                numbered_genres[i] = genre
            else 
                numbered_genres[i] = genre
            end 
        i += 1
        end
        numbered_genres 
    end 

    

end 
    
