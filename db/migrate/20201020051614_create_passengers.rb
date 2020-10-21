class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :username
      t.string :password
      t.float :balance
    end
  end
end
