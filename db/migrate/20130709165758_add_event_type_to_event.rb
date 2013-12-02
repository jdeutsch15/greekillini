class AddEventTypeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_type, :string
    remove_column :events, :type
  end
end
