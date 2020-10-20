class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.integer :better_id
      t.integer :game_id
      t.integer :points_amount
      t.text :expected_outcome
      t.timestamps
    end
  end
end
