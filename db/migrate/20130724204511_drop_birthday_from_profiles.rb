class DropBirthdayFromProfiles < ActiveRecord::Migration
  def up
  	remove_column :profiles, :birthday
  	 add_column :profiles, :birthday, :date
    
  end

  def down
  end
end
