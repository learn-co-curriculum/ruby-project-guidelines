require 'pry'

class User < ActiveRecord::Base
    has_many :recipes
    has_many :ingredients, through: :recipes

    def self.find_or_create_by_name(name)
    
        if User.all.find {|user| user.name == name} 
        else
            User.create name: name 
        end 
        User.all.find {|user| user.name == name} 
    end 


end