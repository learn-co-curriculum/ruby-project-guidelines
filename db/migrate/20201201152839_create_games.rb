class CreateGames < ActiveRecord::Migration[6.0]
  def change
      create_table :games do |t|
        t.string  :name
        t.float   :cost
        t.string  :genre

        t.timestamps
      end
  end
end
