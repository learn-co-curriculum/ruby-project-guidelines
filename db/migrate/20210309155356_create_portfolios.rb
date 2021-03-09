class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |portfolio|
      portfolio.integer :user_id
    end
  end
end
