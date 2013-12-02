class DropTables < ActiveRecord::Migration
  def up
  	drop_table :fraternities
  	drop_table :sororities
  	drop_table :people
  	drop_table :users
  	drop_table :message_boards
  end

  def down
  end
end
