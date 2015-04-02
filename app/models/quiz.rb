class Quiz < ActiveRecord::Base
	has_many :answers

	scope :visible, lambda {where(:visible => true)}
	scope :invisible, lambda {where(:visible => false)}
	scope :sorted, lambda {order("quizzes.position ASC")}
	scope :newest_first, lambda {order("subjects.created_at DESC")}
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
