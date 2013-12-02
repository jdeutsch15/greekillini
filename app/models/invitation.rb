class Invitation < ActiveRecord::Base
	make_voteable
	belongs_to :house
	belongs_to :event
  attr_accessible :event_id, :house_id, :response
end
