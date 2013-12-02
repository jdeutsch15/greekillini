class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :gender, :house_id, :email, :password, :password_confirmation, :remember_me
	has_one :profile
	belongs_to :house
  validates :name, :password, :password_confirmation, :email, :gender, presence: true
  validates :password, :password_confirmation, length: {in: 6..15}
  validates :email, uniqueness: true
  validates :password, confirmation: true
#  validates_each :email do |record, attr, value|
  #	record.errors.add(attr, 'must be valid email address') if value != ^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$
#end
def self.create_new(params)
  student=Student.new(params)
  if student.save then
  logger.info "student saved: #{student.inspect}"
  end
  return student
end

def self.search(search)
	search.present? and all(:conditions =>['name LIKE ? OR email LIKE ?', "%#{search.strip}%", "%#{search.strip}%"])
end
end