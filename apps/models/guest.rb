class Guest < ActiveRecord::Base
     has_many :tickets 

    #  def self.guestbook
    #     #return all guests
    #  end

end