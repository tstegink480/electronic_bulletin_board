class Board < ActiveRecord::Base
  attr_accessible :height, :name, :timezone, :width
  attr_protected :user_id

  has_many :tiles, through: :advertisements
  has_many :advertisements
  belongs_to :user
  has_one :payment_detail, as: :payable

	validates :name, presence: true, length: {minimum: 1}
	validates :height, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
	validates :width, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
	validates :timezone, presence: true
	validates_inclusion_of :timezone, :in => ActiveSupport::TimeZone.zones_map(&:to_s)
	validate :check_board_bounds

	before_create :make_fake_ad

	def age

	end

	def make_fake_ad
    	ad = advertisements.build(:image => 'rails.png', :x_location => 0, :y_location => 0, :width => width, :height => height)
    	ad.user = user
    	pd = create_payment_detail(:amount => width*height)
    	pd.user = user
  	end


	private
		def check_board_bounds
						
		end



def make_payment_detail
    pd = create_payment_detail(:amount => width*height)
    pd.user = user
  end




end
