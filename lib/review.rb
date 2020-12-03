class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :game

    # attr_accessor :game_id, :person_id, :rating, :comment
    
    # @@all_reviews = []

    # def initialize(game_id, person_id, rating, comment)
    #     @game_id = game_id
    #     @person_id = person_id
    #     @rating = rating
    #     @comment = comment
    # end

    # def self.all
    #     @@all_reviews
    # end

    # def self.count
    #     @@all_reviews.count
    # end

    # def self.most_popular_game
    #     @@all_reviews.sort_by(rating)

        
    # end
    def self.ratings_array
        game_names = self.all.map {|review| review.game.name}
        ratings = self.all.map{|review| review.rating}
        combined = game_names.zip(ratings)
    end

    def self.comments_array
        game_names = self.all.map {|review| review.game.name}
        comments = self.all.map {|review| review.comment}
        combined = game_names.zip(comments)
    end

    def self.game_comment_rating_array
        comments = self.all.map {|review| review.comment}
        game_names = self.all.map {|review| review.game.name}
        ratings = self.all.map{|review| review.rating}
        combined = game_names.zip(ratings,comments)
        
    end

    def self.all_reviews
        hash = Hash.new{|hash,key| hash[key] = []}
        self.game_comment_rating_array.each {|value|
        if hash.key?(value[0]) == false
            hash[value[0]] = {:rating => [], :comment => []} 
            hash[value[0]][:rating] << value[1]
            hash[value[0]][:comment] << value[2]
        else
            hash[value[0]][:comment] << value[2]
            hash[value[0]][:rating] << value[1]
        end
        }
        hash
    end 


    # def self.ratings_hash
    #     hash = Hash.new {|hash,key| hash[key] = []}
    #     self.ratings_array.each {|q| hash[q[0]] << q[1]}
    #     hash
    # end

    # def self.comments_hash
    #     hash = Hash.new {|hash, key| hash[key] = []}
    #     self.comments_array.each {|q| hash[q[0]] << q[1]}
    #     hash
    # end
    
    # def self.game_rating_comment_hash

    # end

   
    
    


end