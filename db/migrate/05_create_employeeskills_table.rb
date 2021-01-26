class CreateEmployeeskillsTable < ActiveRecord::Migration[5.1]
    def change
        create_table :employeeskills do |t|
            t.integer :employee_id
            t.integer :skill_id
            t.integer :competency
        end
    end
end
