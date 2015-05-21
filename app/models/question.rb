class Question < ActiveRecord::Base
	belongs_to :survey, inverse_of: :questions
	has_many :answers, :dependent => :destroy
	has_many :guesses, :dependent => :destroy
	has_many :correct_answers, :dependent => :destroy
	accepts_nested_attributes_for :answers, :correct_answers, :reject_if => lambda { |a| a[:content].blank? }

	scope :sorted, lambda { order("questions.created_at ASC")}

	def points
		self.answers.count
	end

	def reset_attributes
		update_all correct_answers: :true
	end


end
