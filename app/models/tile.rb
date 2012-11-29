class Tile < ActiveRecord::Base
  attr_accessible :x_location, :y_location
	attr_protected :board_id, :advertisement_id, :cost

  belongs_to :advertisement
	has_one :board, through: :advertisement

	validates :x_location, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
	validates :y_location, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
	validates :cost, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
	validate :check_tile_bounds


	def age

	end

	private
					def check_tile_bounds
						unless x_location.nil?
										if x_location < advertisement.x_location
											errors.add(:x_location, "X location is less than the ad x location")
										end
										
										if x_location >= advertisement.x_location + advertisement.width
											errors.add(:x_location, "x location is greater than the ad x location plus the ad width")
										end



										if x_location >= board.width
											errors.add(:x_location, "x location is greater than board width")
										end
						end



						unless y_location.nil?
										if y_location >= board.height
											errors.add(:y_location, "y location is greater than board height")
										end

										if y_location >= advertisement.y_location + advertisement.height
											errors.add(:y_location, "y location is greater than the add y location plus the ad height")
										end



										if y_location < advertisement.y_location
											errors.add(:y_location, "Y location is less than the ad y location")
										end
						end

						end


end
