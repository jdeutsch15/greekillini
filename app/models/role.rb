class Role < ActiveRecord::Base
  has_and_belongs_to_many :students, :join_table => :students_roles
  belongs_to :resource, :polymorphic => true
  
  scopify
end
