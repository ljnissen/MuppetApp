class Quiz < ActiveRecord::Base

	belongs_to :survey
	has_many :answers, :dependent => :destroy
	accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }
	

	scope :visible, lambda {where(:visible => true)}
	scope :invisible, lambda {where(:visible => false)}
	scope :sorted, lambda {order("quizzes.position ASC")}
	scope :newest_first, lambda {order("subjects.created_at DESC")}
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
