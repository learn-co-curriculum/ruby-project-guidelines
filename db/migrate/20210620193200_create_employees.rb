class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :rating
      t.integer :years_experience
      t.boolean :full_time
      t.integer :hours_scheduled
    end
  end
end
