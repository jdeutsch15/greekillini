class AddMessageBoardIdToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :message_board_id, :integer
  end
end
