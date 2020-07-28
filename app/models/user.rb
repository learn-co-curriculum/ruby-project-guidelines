require 'pry'

class User < ActiveRecord::Base

    has_many :purchases
    has_many :items, through: :purchases
   
#----I want to be able to insert new Users into our database----->
#---If there is another user with the same name don't allow------>
def self.search_by_name(username)
    User.all
    # binding.pry
end




    def self.total(user_name)
        list=[]
        itemtotal=[]
        Purchase.all.each do |m|
            if m.user.name==user_name
                list.push(m)
            end
        end 
        list.each do |m|
            itemtotal.push(m.item.cost) 
        end
        puts "Hello #{user_name}, your total is $#{itemtotal.sum}."
    end
end