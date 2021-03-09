class CreateCryptos < ActiveRecord::Migration[6.1]
  def change
    create_table :cryptos do |crypto|
      crypto.string :name
      crypto.string :symbol
      crypto.integer :rank
      crypto.float :price
      crypto.float :percent_change_1hr
      crypto.float :percent_change_24hr
      crypto.float :percent_change_7d
    end
  end
end
