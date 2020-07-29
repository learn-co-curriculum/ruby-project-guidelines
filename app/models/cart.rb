class Cart < ActiveRecord::Base
    belongs_to :user
    belongs_to :item
    has_many :mytransactions

    def self.make_my_transaction(cartist)
        Mytransaction.create(cart_id:cartist.id, amount:cartist.item.cost)
    end
 end