class Question < ActiveRecord::Base
	belongs_to :survey
	accepts_nested_attributes_for :survey

	scope :sorted, lambda { order("questions.created_at DESC")}
end
