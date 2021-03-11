require 'pry'

class Portfolio < ActiveRecord::Base
    belongs_to :user


    def self.find_portfolios # Returns portfolio of all cryptos from trades
        title = Artii::Base.new(:font => "slant")
        puts title.asciify("#{@@current_user.user_name}'s Portfolio")

        trader_portfolios = Portfolio.find_by(user_id: self.user_id)
    end

    def self.find_user 
        #select all from users where user.id == self.user_id
    end


    def self.crypto_joiner
        Crypto.joins(:user).where(:users => {:user_id => self.user_id})
    end

    def self.trades
         
    end
end