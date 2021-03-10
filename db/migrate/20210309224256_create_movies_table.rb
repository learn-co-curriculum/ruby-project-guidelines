class CreateMoviesTable < ActiveRecord::Migration[6.1]
  def change
  create_table :movies do |t|
  t.string :title
  t.string :genre
  t.integer :showtime
  t.string :theater
  end
  end
end
