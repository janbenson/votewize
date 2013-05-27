class Answer < ActiveRecord::Base
	belongs_to :category
	belongs_to :question
	belongs_to :user
	scope :answer_count, lambda{|q| where("agree  > ?", 0) }	
  def self.answer_count
      @a= Answer.find_by_sql('select * from answers where agree > 0 or importance > 0 or comments  <> ""')
      @answer_count = @a.count
  end	
end
