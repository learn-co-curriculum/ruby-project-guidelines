class Item < ActiveRecord::Base
    has_many :carts
    has_many :reviews
    has_many :inventory

    def self.search_by_name(brand_name)
        list=[]
        Item.all.each do |m|
            if m.brand==brand_name
               list.push(m)
            end
        end 
       list.each do |m|
        puts "#{m.name}-> #{m.cost}"
       end
     end
end