class Purchase < ActiveRecord::Base
   belongs_to :user
   has_many :items
#    def total
#      totalcost=cart.sum(:cost)
#    end
end