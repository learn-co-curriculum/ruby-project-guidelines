class Game < ActiveRecord::Base

    has_many :reviews
    has_many :users, through: :reviews

    # def some_game
    #     self.all.select {|game| game.genre}
    # end


    def self.game_genres
        self.all.map{|games|games.genre}.uniq.sort
    end

    def self.games_in_genre(genre_name)
        Game.all.select {|game| game.genre == genre_name}.uniq.sort
    end

    def self.average_game_price
        self.all.map {|games|games.cost}.sum/self.all.count
    end

    def self.search_game_by_price(budget)
        self.all.select {|games| games.cost <= budget}
    end

    def self.most_owned_game
        max_owned = 0
        name = nil
        game_array = Review.all.map do |review|
            review.game.name
        end
        game_array.uniq.each do |game_name|
            if game_array.count(game_name) > max_owned
                max_owned = game_array.count(game_name)
                name = game_name
            end
        end
        name
    end

    def self.find_by_name(game_name)
        self.all.each do |game|
            if game.name == game_name
                return game
            end
        end 
    end



end