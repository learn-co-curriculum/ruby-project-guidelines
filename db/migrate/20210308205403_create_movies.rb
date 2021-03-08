class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title 
      t.integer :showtime
      t.integer :age_rating
    end
  end
end
