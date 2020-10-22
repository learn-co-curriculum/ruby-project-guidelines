class AddGenreColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :genre, :string
  end
end
