class CreateReview < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.integer :user_id
      t.integer :item_id
    end
  end
end
