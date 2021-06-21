class DeleteCityAndNameFromAdoptions < ActiveRecord::Migration[6.1]
  def change
    remove_column :adoptions, :city
    remove_column :adoptions, :name
  end
end
