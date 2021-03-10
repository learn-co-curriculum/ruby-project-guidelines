class Hadichloun < ActiveRecord::Migration[6.1]
  def change
    add_column(:guests, :password, :integer)
  end
end
