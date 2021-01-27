class CreateEmployeesTable < ActiveRecord::Migration[5.1]
    def change
        create_table :employees do |t|
            t.string :name
            t.integer :employer_id, :foreign_key => true 
            t.integer :project_id, :foreign_key => true 
        end
    end
end
