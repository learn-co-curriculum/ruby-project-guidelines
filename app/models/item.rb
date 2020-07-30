class Item < ActiveRecord::Base
    has_many :purchases
    has_many :reviews

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

     def self.suggest_item
        
     end 
end