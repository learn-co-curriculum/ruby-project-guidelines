class ChangeStoreToAdoption < ActiveRecord::Migration[6.1]
  def change
    rename_table :stores, :adoptions
  end
end
