class Profile < ActiveRecord::Base
	belongs_to :student
  attr_accessible :birthday, :interests, :student_id, :phone, :relationship_status
  #validates :person_id, uniqueness: true
def self.create_new(params)
	profile=Profile.new(params)
	if profile.save then
	logger.info "profile saved: #{profile.inspect}"

end
return profile
end
end

