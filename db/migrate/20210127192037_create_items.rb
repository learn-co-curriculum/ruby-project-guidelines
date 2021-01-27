class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do
      |item|
      item.string :name
      item.timestamps
    end
  end
end
