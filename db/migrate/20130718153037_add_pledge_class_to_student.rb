class AddPledgeClassToStudent < ActiveRecord::Migration
  def change
    add_column :students, :pledge_class, :string
  end
end
