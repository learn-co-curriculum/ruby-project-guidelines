class CreateProjectskillsTable < ActiveRecord::Migration[5.1]
    def change
        create_table :projectskills do |t|
            t.integer :project_id, :foreign_key => true 
            t.integer :skill_id, :foreign_key => true 
            t.integer :competency_requirement
        end
    end
end
