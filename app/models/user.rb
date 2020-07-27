class User < ActiveRecord::Base
    has_many :purchases
    has_many :items, through: :purchases
    has_many :reviews, through: items
end