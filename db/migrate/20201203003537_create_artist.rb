class CreateArtist < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
    end
  end
end