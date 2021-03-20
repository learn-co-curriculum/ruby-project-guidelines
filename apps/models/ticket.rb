class Ticket < ActiveRecord::Base
     belongs_to :guest
     belongs_to :theater
     belongs_to :movie

    #  def self.purchases
    #     #return all purchases
    #  end

end
