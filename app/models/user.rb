# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#  image           :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :name, :image, :password, :password_confirmation
  mount_uploader :image, UserUploader
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :heroes
  has_many :hero_images
  has_many :videos

  before_save { self.email.downcase! }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end


