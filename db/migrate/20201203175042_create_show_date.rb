class CreateShowDate < ActiveRecord::Migration[6.0]
  def change
    create_table :show_dates do |t|
      t.string :date
      t.integer :venue_id
      t.integer :artist_id
    end
  end
end