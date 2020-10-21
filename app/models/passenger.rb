class Passenger < ActiveRecord::Base
    has_many :tickets
    has_many :flights, through: :tickets

    def self.login(username, password)
        return self.find_by(username: username, password: password)
    end

    def add_money_to_account(balance_to_add)
        self.balance += balance_to_add
        self.save
    end
    
    def deduct_money_from_account(balance_to_deduct)
        self.balance -= balance_to_deduct
        self.save
    end
end
