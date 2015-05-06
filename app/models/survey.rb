class Survey < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
	
	accepts_nested_attributes_for :questions , :reject_if => lambda { |a| a[:content].blank? }

	validates_uniqueness_of :name

	scope :sorted, lambda { order("questions.created_at DESC")}

	#validates_uniqueness_of :name

	def next
		Survey.limit(1).order("id ASC").where("id > ?", id).first
	end

	def previous
		Survey.limit(1).order("id DESC").where("id < ?", id).last
	end

	def first_record
		Survey.where("id > ?", id).first
	end
end
