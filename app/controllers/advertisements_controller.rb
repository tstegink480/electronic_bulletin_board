class AdvertisementsController < ApplicationController
	def new
		@board = Board.find(params[:board_id])
		@advertisement = Advertisement.new()
	end

def create
    @board = Board.find(params[:board_id])
    @advertisement = @board.advertisements.build(params[:advertisement])
                unless @advertisement.image.nil?

                    @advertisement.image = @advertisement.image.read()
                end
    @advertisement.user = current_user

    if @advertisement.save

      flash[:success] = "Advertisement created"
      redirect_to @board
    else
                        flash.now[:error] = 'Invalid advertisement information'
      render 'new'
    end
  end

	def image_contents=(image)
		image.read()
	end
	
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
end