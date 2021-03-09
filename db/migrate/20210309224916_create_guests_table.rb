class CreateGuestsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :name
    end
  end
end
