class ChangeMovieTableColumnToAcceptIds < ActiveRecord::Migration[6.1]
  def change
    rename_column(:movies, :genre, :genre_id)
    change_column(:movies, :genre_id, :integer)
  end
end
