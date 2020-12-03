class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :game_id
      t.integer :user_id
      t.float :rating
      t.string :comment
    end
  end
end


