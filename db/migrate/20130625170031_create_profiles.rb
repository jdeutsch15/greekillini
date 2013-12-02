class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :interests
      t.string :relationship_status
      t.string :birthday
      t.string :phone
      t.string :person_id

      t.timestamps
    end
  end
end
