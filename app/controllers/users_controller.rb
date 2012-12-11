class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy, :index]
  before_filter :correct_user_show, only: [:show]

  def show
          @user = User.find(params[:id])
          if !signed_in?
            flash[:error] = "Not Signed in"
            redirect_to (root_path)
          end
  end

  def new
      if signed_in?
        redirect_to(root_path)
      end
      @user = User.new
  end
  
  def create
  	@user = User.new(params[:user])
  	if signed_in?
      	redirect_to(root_path)
 	 else if @user.save
        sign_in @user
      	flash[:success] = 'Welcome'
      	redirect_to @user
  	else
	  	  flash[:error] = 'Not signed in'
      	render 'new'
      end
  	end
  end
  
  def index
    @users = User.all
  end
  
  def edit
  end
  
    def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.admin?
        redirect_to(root_path)
    else
        User.find(params[:id]).destroy
        flash[:success] = "User destroyed."
        redirect_to users_url
    end
  end
  

  # def sign_in(user)
  #   cookies.permanent[:remember_token] = user.remember_token
  #   self.current_user = user
  # end
  
  # def signed_in?
  #   !current_user.nil?
  # end
  
  # def current_user=(user)
  #   @current_user = user
  # end
  
  # def current_user
  #   @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  # end
  
  # def current_user?(user)
  #   user == current_user
  # end
  
  # def signed_in_user
  #   unless signed_in?
  #     store_location
  #     redirect_to signin_url, notice: "Please sign in."
  #   end
  # end
  
  # def sign_out
  #   self.current_user = nil
  #   cookies.delete(:remember_token)
  # end
  
  # def redirect_back_or(default)
  #   redirect_to(session[:return_to] || default)
  #   session.delete(:return_to)
  # end

  # def store_location
  #   session[:return_to] = request.url
  # end



    private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
     def admin_user
      if current_user.nil?
        flash[:error] = "Not signed in"
        redirect_to(root_path)
     else
      unless current_user.admin?
        flash[:error] = "Not an administrator"
        redirect_to(root_path)
      end
    end
  end



    #To prevent you from seeing a profile that isn't yours
def correct_user_show
      @user = User.find(params[:id])
      if !signed_in?
        flash[:error] = "Not signed in"
        redirect_to(root_path) 
      else
      unless current_user?(@user)
        flash[:error] = "Wrong user"
        redirect_to(root_path)
      end
    end
  end
    

end
