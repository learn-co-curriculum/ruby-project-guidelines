class Item < ActiveRecord::Base
    has_many :purchases
    has_many :users, through: :purchases
    has_many :reviews, through: :users
end