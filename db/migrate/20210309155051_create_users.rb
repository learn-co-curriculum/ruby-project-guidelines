class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |user|
      user.string :user_name
      user.string :password
    end
  end
end
