class Advertisement < ActiveRecord::Base
  attr_accessible :height, :image, :width, :x_location, :y_location
	attr_protected :board_id, :user_id

  has_many :tiles
  belongs_to :user
  belongs_to :board
  has_many :payment_details, as: :payable


	


	validates :x_location, presence: true, :numericality => { :greater_than_or_equal_to => 0}
 	validates :y_location, presence: true, :numericality => { :greater_than_or_equal_to => 0}
  validates :width, presence: true, :numericality => { :greater_than_or_equal_to => 1}
  validates :height, presence: true, :numericality => { :greater_than_or_equal_to => 1}
	validates :image, presence: true
	validate :check_advertisement_bounds


	def image_contents=
 	  image.read()	
 	end

	def charge

	end

	def amount

	end

	before_create :make_tiles



def make_tiles
	  	for x in x_location..(x_location + width - 1) do 
	  		for y in y_location..(y_location + height - 1) do
	  			t = board.tiles.where(:x_location => x, :y_location => y).first
	  			if t.nil?
		  			t = tiles.build(:x_location => x, :y_location => y)
		  			t.cost = 0
		  		else
		  			prev_cost = t.cost
		  			t.destroy
		  			t = tiles.build(:x_location => x, :y_location => y)
		  			new_cost = 2 * prev_cost
		  			if new_cost < 1
		  				new_cost = 1
		  			end
		  			new_cost = new_cost.to_f
		  			t.cost = new_cost
		  		end

	  		end
	  	end
  end















	private
					def check_advertisement_bounds
						unless x_location.nil?
										if board.width <= x_location
											errors.add(:x_location, "x location is greater than or equal to the board width")
										end

										if board.width < x_location + width
											errors.add(:x_location, "x location plus width is greater than the board width")
										end

						end
						
						unless y_location.nil?
										if board.height <= y_location
											errors.add(:y_location, "y location is greater than or equal to the board height")
										end

										if board.height < y_location + height
											errors.add(:y_location, "y location plus height is greater than the board height")
										end
						end
					end












def size_check
		if x_location.is_a?(Integer) && y_location.is_a?(Integer) && width.is_a?(Integer) && height.is_a?(Integer)
			if x_location >= board.width
				errors.add(:x_location, "can't be larger than the board width")
			end

			if y_location >= board.height
				errors.add(:y_location, "can't be larger than the board height")
			end

			if width > board.width
				errors.add(:width, "can't be larger than the board width")
			end

			if height > board.height
				errors.add(:height, "can't be larger than  the board height")
			end

			if x_location + width > board.width
				errors.add(:x_location, "combined can't be larger than the board width")
			end

			if y_location + height > board.height
				errors.add(:y_location, "combined can't be larger than the board height")
			end
		end
	end
















	
end
