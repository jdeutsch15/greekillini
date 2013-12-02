class AddStudentIdToProfile < ActiveRecord::Migration
  def change
  	remove_column :profiles, :person_id
    add_column :profiles, :student_id, :integer
  end
end
