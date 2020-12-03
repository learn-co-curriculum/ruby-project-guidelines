class User < ActiveRecord::Base
    has_many :reviews
    has_many :games, through: :reviews

    # attr_accessor :name, :age

    # @@all_users = []

    # def initialize(name,age)
    #     @name = name
    #     @age = age
    #     self.class.all << self
    # end

    # def self.all
    #     @@all_users
    # end

    # def self.count
    #     @@all_users.count
    # end

    # def total_reviews
    #     Review.all.select {|review| review}.map
    # end

    def new_review(rating, comment)
        game_id = Game.find_by_name("Zelda")
        Review.create(rating: rating,
                    comment: comment,
                    game_id: game_id.id,
                    person_id: self.id
                    )
    end

    # def self.see_reviews
    #     Review.all.map do |review| 
    #         review.comment
    #     end
    # end 
end