class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :attraction_name
      t.string :date
      t.string :venue
      t.string :genre
      t.float :price_min
      t.float :price_max
    end
  end
end
