class CreateTheaters < ActiveRecord::Migration[6.1]
  def change
    create_table :theaters do |t|
      t.string :name 
      t.string :viewing_room
      # t.integer :seats
    end
  end
end
