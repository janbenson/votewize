class UsersController < ApplicationController

  before_filter :authenticate,
                :only => [:index, :edit, :update, :destroy,
                :followers, :following, :reps]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  layout "frontpage"
  respond_to :json
  
  def index
    @users = User.paginate(:page => params[:page])
    @title = "All users"
  end
  
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end
  
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  def new
    @user  = User.new
    @title = "Sign up"
  end
  
  def login
    @user  = User.new
    @title = "Sign in please...."
  end

    
    
    
  end
  def create
    @user = User.new(params[:user])
    @user.save
    @profile = Profile.new
    @profile.id = @user.id
    if @profile.save 
    	    shownewuser_path @user.id
    	    redirect_to shownewuser_path :id => @user.id
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit user"  
  end
  
  def update
  	  @user = User.find_by_email(params[:email])
          @profile = @user.profiles
          showuser_path @user.id
          redirect_to showuser_path :id => @user.id
  end

  def destroy
    @user.destroy
    redirect_to users_path, :flash => { :success => "User destroyed." }
  end
    
  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end
end
