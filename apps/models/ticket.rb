class Ticket < ActiveRecord::Base
     belongs_to :guest
     belongs_to :theater

    #  def self.purchases
    #     #return all purchases
    #  end

end
