class Cart < ActiveRecord::Base
    belongs_to :user
    belongs_to :item
    has_many :mytransactions

    def self.make_my_transaction(cartist)
        Mytransaction.create(item_id:cartist.item.id, user_id:cartist.user.id,cart_id:cartist.id)
    end
 end