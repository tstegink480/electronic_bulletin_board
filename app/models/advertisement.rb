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
	
end
