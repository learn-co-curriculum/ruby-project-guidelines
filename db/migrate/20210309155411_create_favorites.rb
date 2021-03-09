class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |favorite|
      favorite.string :name
      favorite.float :price
      favorite.string :symbol
      favorite.integer :crypto_id
      favorite.integer :user_id
    end
  end
end
