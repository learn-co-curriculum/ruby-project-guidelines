class CreateProjectskillsTable < ActiveRecord::Migration[5.1]
    def change
        create_table :projectskills do |t|
            t.integer :project_id
            t.integer :skill_id
            t.integer :competency_requirement
        end
    end
end
