class Category < ActiveRecord::Base
  attr_accessible :id, :name, :pic ,:small_pic, :question_attributes
	has_many :questions, :dependent => :destroy
  validates_presence_of :name,  :id
  accepts_nested_attributes_for :questions
end
