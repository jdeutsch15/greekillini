class AddMultipleFieldsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :name, :string
    add_column :people, :gender, :string
    add_column :people, :house_id, :integer
  end
end
