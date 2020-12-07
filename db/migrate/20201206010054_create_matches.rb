class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :date
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :home_team_goals
      t.integer :away_team_goals
      t.integer :arena_id
    end
  end
end
