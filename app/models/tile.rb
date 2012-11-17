class Tile < ActiveRecord::Base
  attr_accessible :x_location, :y_location
	attr_protected :board_id, :advertisement_id, :cost

  belongs_to :advertisement
  belongs_to :board

	validates :x_location, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
	validates :y_location, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
	validates :cost, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

end
