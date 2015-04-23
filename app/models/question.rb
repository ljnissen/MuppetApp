class Question < ActiveRecord::Base
	belongs_to :survey
	has_many :answers, :dependent => :destroy
	has_many :correct_answers, :dependent => :destroy
	accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }

	scope :sorted, lambda { order("questions.created_at DESC")}

	def points
		self.answers.count
	end

	def next
		Question.limit(1).order("id asc").where("id > ?", id).first
	end

	def previous
		Question.limit(1).order("id desc").where("id < ?", id).last
	end
end
