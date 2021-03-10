class ChangeDateOnLessons < ActiveRecord::Migration[6.1]
  def change
    change_column :lessons, :date, :datetime
  end
end
