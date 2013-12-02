class AddMultipleFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :name, :string
    add_column :students, :gender, :string
    add_column :students, :house_id, :integer
  end
end
