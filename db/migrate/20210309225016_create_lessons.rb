class CreateLessons < ActiveRecord::Migration[6.1]
    def change
      create_table :lessons do |t|
        t.string :topic
        t.string :date
        t.references :student
        t.references :tutor
        t.timestamps 
    end
  end
end
