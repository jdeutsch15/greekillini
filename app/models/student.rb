class Student < ActiveRecord::Base
  rolify
  after_create :default_role
  make_voter
  ROLES = ['Student', 'Social Chair']
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_one :profile
belongs_to :house
has_many :messages, dependent: :destroy
has_and_belongs_to_many :roles, :join_table => :students_roles
 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :gender, :email, :pledge_class, :password, :password_confirmation, :remember_me, :house_id, :role
attr_accessible :role_ids, :as => :admin
validates :name, :password, :password_confirmation, :email, :gender, presence: true
  validates :password, :password_confirmation, length: {in: 6..15}
  validates :email, uniqueness: true
  validates :password, confirmation: true
    # attr_accessible :title, :body

def self.search(search)
	search.present? and all(:conditions =>['name LIKE ? OR email LIKE ?', "%#{search.strip}%", "%#{search.strip}%"])
end
def default_role
  self.roles << Role.where(:name => 'Student').first
end
def feed
  Message.findall
end
def role?(role)
  return  !!self.roles.find_by_name(role.to_s.camelize)
end
 def capitalize_name
    "#{name.titleize}"
  end
end