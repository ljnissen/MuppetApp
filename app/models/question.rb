class Question < ActiveRecord::Base
	belongs_to :survey
	has_many :answers, :dependent => :destroy
	has_many :correct_answers, :dependent => :destroy
	accepts_nested_attributes_for :answers, :correct_answers, :reject_if => lambda { |a| a[:content].blank? }

	scope :sorted, lambda { order("questions.created_at ASC")}

	def points
		self.answers.count
	end


end
