class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :location
      t.string :type

      t.timestamps
    end
  end
end
