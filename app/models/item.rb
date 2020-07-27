class Item < ActiveRecord::Base
    has_many :users, through: :reviews

    # def select
    #     cart=[]
    #     cart.push(self)
    # end
end