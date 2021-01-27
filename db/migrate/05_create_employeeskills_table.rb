class CreateEmployeeskillsTable < ActiveRecord::Migration[5.1]
    def change
        create_table :employeeskills do |t|
            t.integer :employee_id, :foreign_key => true 
            t.integer :skill_id, :foreign_key => true 
            t.integer :competency
        end
    end
end
