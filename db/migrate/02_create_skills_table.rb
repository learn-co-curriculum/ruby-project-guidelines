class CreateSkillsTable < ActiveRecord::Migration[5.1]
    def change
        create_table :skills do |t|
            t.string :skill_name
        end
    end
end
