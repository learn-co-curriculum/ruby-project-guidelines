# Store -< Employee
class Store < ActiveRecord::Base
    has_many :employees

    def avg_wage
        wages = self.employees.map { |employee| employee.salary }

        (wages.sum.to_f / wages.count).round(2)
    end

    def num_emps_at_store
        self.employees.count
    end 
end