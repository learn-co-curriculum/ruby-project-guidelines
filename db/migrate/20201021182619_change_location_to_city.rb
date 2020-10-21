class ChangeLocationToCity < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.rename :location, :city
    end
  end
end
