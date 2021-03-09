class CreateTicketsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :theater
      t.string :movie
      t.string :guest
    end
  end
end
