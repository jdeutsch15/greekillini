class CreateEventsHouses < ActiveRecord::Migration
  def up
  	create_table :events_houses, :id => false do |t|
  		t.integer :event_id
  		t.integer :house_id
  end
end
  def down
  	drop_table :events_houses
  end
end 
