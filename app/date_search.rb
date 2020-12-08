class DateSearch

    def search_by_date
        puts "Please enter a date: MM/DD/YYYY"
        date = STDIN.gets.chomp.split("/")
        date_formatted =  "#{date[2]}-#{date[0]}-#{date[1]}"
        Event.all.select {|e|e.date == date_formatted}
    end

end