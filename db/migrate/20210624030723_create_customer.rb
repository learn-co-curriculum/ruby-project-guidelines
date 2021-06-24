class CreateCustomer < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :name
    end
  end
end
