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
    current_user = @user
    @title = "Sign up"
  end
  
  def create
    @user = User.new
    @user.email = params[:email]
    @user.password_digest = params[:password]
    @user.save
    current_user = @user
    @profile = Profile.new
    @profile.id = @user.id

     if @profile.save
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
   if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "Profile updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
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