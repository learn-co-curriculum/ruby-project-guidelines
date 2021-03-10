class ChangingTableColumnsToAcceptIds < ActiveRecord::Migration[6.1]
  def change
    rename_column(:movies, :theater, :theater_id)
    change_column(:movies, :theater_id, :integer)
    rename_column(:tickets, :theater, :theater_id)
    rename_column(:tickets, :movie, :movie_id)
    rename_column(:tickets, :guest, :guest_id)
    change_column(:tickets, :theater_id, :integer)
    change_column(:tickets, :movie_id, :integer)
    change_column(:tickets, :guest_id, :integer)

  end
end
