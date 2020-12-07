class CreateVenue < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :city
      t.string :state
    end
  end
end