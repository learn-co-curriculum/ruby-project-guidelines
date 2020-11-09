class CreateBetters < ActiveRecord::Migration[6.0]
  def change
    create_table :betters do |t|
      t.string :username
      t.integer :points_balance
      t.timestamps
    end
  end
end
