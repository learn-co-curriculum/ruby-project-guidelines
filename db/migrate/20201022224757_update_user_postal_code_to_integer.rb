class UpdateUserPostalCodeToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :postal_code, :integer
  end
end
