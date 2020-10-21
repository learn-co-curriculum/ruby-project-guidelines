class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :url
      t.string :state
      t.string :city
      t.integer :postal_code
    end
  end
end
