class Question < ActiveRecord::Base
	belongs_to :survey

	scope :sorted, lambda { order("questions.created_at DESC")}
end
