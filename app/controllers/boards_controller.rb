class BoardsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]



def create
  @board = current_user.boards.create(params[:board])
 if @board.save
      
      flash[:success] = 'Welcome'
      redirect_to @board
  else
      render 'new'
      end
  end
  
  
  def new
  	@board = Board.new
  end


    def show
		@board = Board.find(params[:id])
	end  


	def index
		@board = Board.all
	end

  def signed_in?
    !current_user.nil?
  end


  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end


  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end


  def store_location
    session[:return_to] = request.url
  end

end