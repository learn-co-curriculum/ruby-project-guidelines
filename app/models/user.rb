class User < ActiveRecord::Base
    has_many :carts
    has_many :items, through: :carts

    def self.total(user_name)
        list=[]
        itemtotal=[]
        Cart.all.each do |m|
            if m.user==user_name
                list.push(m)
            end
        end 
        list.each do |m|
            itemtotal.push(m.item.cost) 
        end
        puts "Hello #{user_name.name}, your total is $#{itemtotal.sum}."
    end
end