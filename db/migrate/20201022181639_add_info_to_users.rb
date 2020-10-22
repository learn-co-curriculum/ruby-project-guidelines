class AddInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :min_price, :float
    add_column :users, :max_price, :float
    add_column :users, :state, :string
    add_column :users, :postal_code, :string
  end
end
