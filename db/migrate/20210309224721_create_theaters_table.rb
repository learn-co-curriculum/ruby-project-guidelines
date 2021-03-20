class CreateTheatersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :theaters do |t|
      t.string :name
    end
  end
end
