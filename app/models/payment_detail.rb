class PaymentDetail < ActiveRecord::Base
  attr_accessible :amount
	attr_protected :payable_id, :payable_type, :user_id

  belongs_to :user
  belongs_to :payable , polymorphic: true

	validates :amount, presence: true, numericality: true
	

end
