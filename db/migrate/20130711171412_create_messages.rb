class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :student_id

      t.timestamps
    end
    add_index :messages, [:student_id, :created_at]
  end
end
