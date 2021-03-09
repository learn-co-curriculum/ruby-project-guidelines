class CreateGenresTable < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :genre
    end
  end
end
