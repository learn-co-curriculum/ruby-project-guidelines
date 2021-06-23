# Employee -< Store
class Employee < ActiveRecord::Base
    has_many :adoptions
    has_many :pets, through: :adoptions
    belongs_to :store

    def pets_at_my_store
        Pet.all.map{|pet| pet_id == self.store.pet_id}
    end

    def change_status
        if self.full_time == true
            self.full_time = false
        else self.full_time = true
        end
    end

    def change_hours_scheduled(new_hours)
        self.hours_scheduled = new_hours
    end

    def delete_my_profile
        self.clear
    end

    def change_store(new_store)
        self.store = new_store
    end

    def make_adoption(pet_id)
        Adoption.create(employee_id: self.id, pet_id: pet_id)
    end

    def make_sale(product_id, customer_id)
        Sale.create(employee_id: self.id, product_id: product_id, customer_id: customer_id)
    end


end