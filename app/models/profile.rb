class Profile < ActiveRecord::Base
  attr_accessible :cat1, :cat10, :cat11, :cat12, :cat13, :cat14, :cat15, :cat16, :cat17, :cat18, :cat2, :cat3, :cat4, :cat5, :cat6, :cat7, :cat7, :cat8, :cat9, :id
belongs_to :user
  
end
