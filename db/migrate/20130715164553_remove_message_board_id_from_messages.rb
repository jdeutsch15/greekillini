class RemoveMessageBoardIdFromMessages < ActiveRecord::Migration
  def up
  	remove_column :messages, :message_board_id
  end

  def down
  end
end
