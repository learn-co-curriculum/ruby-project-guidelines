class CreeateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :planet_id
    end
  end
end
