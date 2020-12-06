class CreateArenas < ActiveRecord::Migration[6.0]
  def change
    create_table :arenas do |t|
      t.string :name
    end
  end
end
