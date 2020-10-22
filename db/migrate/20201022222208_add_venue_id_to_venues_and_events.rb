class AddVenueIdToVenuesAndEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :venue_id, :string
    add_column :venues, :venue_id, :string
    add_column :events, :venue_id, :string
  end
end
