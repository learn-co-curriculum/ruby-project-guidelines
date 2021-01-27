class Store < ActiveRecord::Base
    has_many :inventories
    has_many :items, through: :inventories
end