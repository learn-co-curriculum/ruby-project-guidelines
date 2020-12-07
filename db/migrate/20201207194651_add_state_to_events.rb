class AddStateToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_state, :string
  end
end
