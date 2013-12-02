class Message < ActiveRecord::Base
	
  attr_accessible :content, :student_id
  belongs_to :student
  validates :student_id, presence: true
 
  validates :content, presence: true, length: {maximum: 150}
  default_scope order: 'messages.created_at DESC'

  
end
