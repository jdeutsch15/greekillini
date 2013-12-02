class House < ActiveRecord::Base
	has_and_belongs_to_many :events, :uniq => true
	has_many :students
	has_many :invitations
  attr_accessible :location, :name, :house_type
end
