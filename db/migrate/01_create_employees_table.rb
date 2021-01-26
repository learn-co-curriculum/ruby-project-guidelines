class CreateEmployeesTable < ActiveRecord::Migration[5.1]
    def change
        create_table :employees do |t|
            t.string :name
            t.integer :employer_id
            t.integer :project_id
        end
    end
end
