class Survey < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
	accepts_nested_attributes_for :questions

	scope :sorted, lambda { order("questions.created_at DESC")}
end
