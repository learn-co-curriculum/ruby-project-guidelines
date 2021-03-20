class CreateMoviesTable < ActiveRecord::Migration[6.1]
  def change
  create_table :movies do |t|
  t.string :title_id
  t.string :genre_id
  t.integer :showtime_id
  t.string :theater
  end
  end
end
