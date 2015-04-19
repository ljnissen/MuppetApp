class Question < ActiveRecord::Base
	belongs_to :survey
	has_many :answers, :dependent => :destroy
	accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }

	scope :sorted, lambda { order("questions.created_at DESC")}

	def next
		Question.limit(1).order("id ASC").where("id > ?", id).first
	end

end
