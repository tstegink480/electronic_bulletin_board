class User < ActiveRecord::Base
  attr_accessible :email, :name
	attr_protected :admin, :password_digest, :remember_token

	has_secure_password
  has_many :boards
  has_many :advertisements
  has_many :payment_details

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :name, presence: true, length: { maximum: 50 }

end
