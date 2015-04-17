class Survey < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
	has_many :quizzes, :dependent => :destroy
	accepts_nested_attributes_for :questions, :quizzes, :reject_if => lambda { |a| a[:content].blank? }

	scope :sorted, lambda { order("questions.created_at DESC")}
end
