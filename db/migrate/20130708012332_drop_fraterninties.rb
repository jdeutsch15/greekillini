class DropFraterninties < ActiveRecord::Migration
  def up
  	drop_table :fraterninties
  end

  def down
  end
end
