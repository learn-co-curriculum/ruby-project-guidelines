class Item < ActiveRecord::Base
    has_many :inventories 
    has_many :stores, through: :inventories
    has_many :purchases
    has_many :users, through: :purchases
end