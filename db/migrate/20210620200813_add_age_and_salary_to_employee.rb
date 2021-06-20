class AddAgeAndSalaryToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :age, :integer
    add_column :employees, :salary, :integer
  end
end
