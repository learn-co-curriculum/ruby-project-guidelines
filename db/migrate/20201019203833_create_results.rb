class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :karma
    end
  end
end
