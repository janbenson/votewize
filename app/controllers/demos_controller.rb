class DemosController < ApplicationController
           @logged_in = false
           @cat = Category.all
           layout "prefrontpage"

 def index
          
 end
 def show
 	 
 end 	 
  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end  
end
