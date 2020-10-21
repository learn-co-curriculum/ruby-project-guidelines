class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.belongs_to :venue
      t.string :name
      t.string :url
      t.datetime :date
      t.integer :price
      t.boolean :family_friendly
    end
  end
end
