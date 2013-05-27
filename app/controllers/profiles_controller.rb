class ProfilesController < ApplicationController

layout "frontpage"	
respond_to :json

def update
   @profile= Profile.find_by_id(params[:uid]) 
   @profile.update_attribute(params[:userpri], params[:categoryValue])
   @category_id = params[:categoryValue].to_i
   @category = Category.find(@category_id)
   @question = @category.questions.find_all
   @question.each do |question| 
	    @answer = Answer.new
	    @answer.question_id = question.id
	    @answer.user_id = params[:uid]  
	    @answer.save
    end
     respond_to do |format|
             format.js
     end
 end
 
 def remaining
     @up = Profile.find(params[:uid])
     @up_list = [ @up[:cat1], @up[:cat2], @up[:cat3],  @up[:cat4], @up[:cat5], @up[:cat6], @up[:cat7], @up[:cat8], @up[:cat9], @up[:cat10], @up[:cat11], @up[:cat12], @up[:cat13], @up[:cat14], @up[:cat15], @up[:cat16], @up[:cat17], @up[:cat18] ] 
     @up_list = @up_list.reject(&:nil?)
     @remaining_priorities_count = Category.count -@up_list.count
 end 	 
 
end
