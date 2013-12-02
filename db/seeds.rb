# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' }, 
  { :name => 'Student' }, 
  { :name => 'Social Chair'}
], :without_protection => true)
puts 'SETTING UP DEFAULT Student LOGIN'
student = Student.create! :name => 'First Student', :email => 'student@example.com', :password => 'basketball', :password_confirmation => 'basketball', :gender => 'male'
puts 'New student created: ' << student.name
student2 = Student.create! :name => 'Second Student', :email => 'student2@example.com', :password => 'basketball', :password_confirmation => 'basketball', :gender => 'female'
puts 'New student created: ' << student2.name
student.add_role :admin
student2.add_role :VIP