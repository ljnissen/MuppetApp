class Survey < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
	
	accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }

	scope :sorted, lambda { order("questions.created_at DESC")}

	def next
		Survey.limit(1).order("id ASC").where("id > ?", id).first
	end

	def previous
		Survey.limit(1).order("id DESC").where("id < ?", id).last
	end
end
