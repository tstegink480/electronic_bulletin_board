class BoardsController < ApplicationController
  before_filter :signed_in_user_board, only: [:new, :create]


  def new
      @board = Board.new
  end
  
  def create
    @board = current_user.boards.create(params[:board])
    if @board.save
            #@pd = payment_details
            @advertisement = @board.advertisements.build()
            @advertisement.x_location = 0
            @advertisement.y_location = 0
            @advertisement.height = @board.height
            @advertisement.width = @board.width
            
            @advertisement.image = "rails.png"
            
            @advertisement.user = current_user
            @advertisement.save
            flash[:success] = "Board created"
            redirect_to @board
    else
            flash.now[:error] = 'Invalid board information'
            render 'new'
    end
  end
  
  def index
    @boards = Board.all
  end
  
  def show
      @board = Board.find(params[:id])
      @ads = @board.advertisements
  end
  
  
end