class CategoriesController < ApplicationController
layout "frontpage"
respond_to :json
def index
    @categorys = Category.all
  end
  
  def show
   @category = Category.find(params[:data])
   
   @questions = @category.questions.find_all
   
   @current_question_rec =  @questions.first
   @current_question = @current_question_rec.question
   @current_question_id = @current_question_rec.question_id
   @answer =   @answer = Answer.find_by_sql(["SELECT answers.* from answers 
   	   WHERE answers.user_id = ? AND answers.question_id = ?",
   	   (params[:id]), @current_question_id])  
   render
  end
  
  def new
    @category = Category.new
    3.times do
    	    question = @category.questions.build
            4.times { question.answers.build }
    end
  end
  
  def create
    @category = Category.new(params[:Category])
    if @category.save
      flash[:notice] = "Successfully created Category."
      redirect_to @category
    else
      render :action => 'new'
    end
  end
  
  def edit
     @category = Category.find(params[:category])
      if @category.update_attributes (params[:category])
  	 	 
  	 	 
 	  	  flash[:notice] = "Successfully updated Answer."
      redirect_to back
  end
    end
  def update_answers
  	  @category = Category.find(params[:id])
  	  if @category.update_attributes (params[:id])
  	 	 
  	 	 
 	  	  flash[:notice] = "Successfully updated Answer."
      redirect_to back
    end
  end
  
  def update
     @formresults = params[:category]	  
     @category = Category.find(params[:id])	   
     @formresults = params[:category]	  
     @question_id = @formresults[:question_id]
     @user_id = @formresults[:user_id]
     @answer_details = @formresults[:answer]

     @answer=@category.questions.find(@question_id).answers.find_by_user_id(@user_id)
     @answer.agree = @answer_details[:agree]
     @answer.importance = @answer_details[:importance]
     @answer.importance = @answer_details[:comments]
     
     if @answer.save then
     	     @counter = @question_id.to_i
     	     @counter = @counter+1
     	     @current_question_rec = @category.questions.find_by_question_id(@counter)
     	     @current_question = @current_question_rec.question 
     	     @current_question_id = @counter
     	     @answer = @category.questions.find(@current_question_id).answers.find_by_user_id(@user_id)
     	     
     	     
 	 respond_to do |format|
 	     format.html { redirect_to @category }
             format.js { render }
     end 
end
 end
 def updateanswers
     @formresults = params[:category]	  
     @category = Category.find(params[:id])	   
     @formresults = params[:category]	  
     @question_id = @formresults[:question_id]
     @user_id = @formresults[:user_id]
     @answer_details = @formresults[:answer]

     @answer=@category.questions.find(@question_id).answers.find_by_user_id(@user_id)
     @answer.agree = @answer_details[:agree]
     @answer.importance = @answer_details[:importance]
     @answer.importance = @answer_details[:comments]
     
     if @answer.save then
     	     @counter = @question_id.to_i
     	     @counter = @counter+1
     	     @current_question_rec = @category.questions.find_by_question_id(@counter)
     	     @current_question = @current_question_rec.question 
     	     @current_question_id = @counter
     	     @answer = @category.questions.find(@current_question_id).answers.find_by_user_id(@user_id)
     	     
     	     
 	 respond_to do |format|
 	     format.html { redirect_to @category }
             format.js { render }
     end 
end
 end  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Successfully destroyed Category."
    redirect_to Categorys_url
  end
 
end

