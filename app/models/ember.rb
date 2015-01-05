# == Schema Information
#
# Table name: embers
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  city       :string(255)
#  state      :string(255)
#  name       :string(255)
#  synopsis   :text
#  story      :text
#  birthdate  :date
#  deathdate  :date
#  image      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  image_tmp  :string(255)
#  slug       :string(255)
#

class Ember < ActiveRecord::Base	
	attr_accessible :name, :first_name, :last_name, :city, :state, :synopsis, :story, :image, :birthdate, :deathdate

	extend FriendlyId
	friendly_id :name, use: :slugged

	mount_uploader :image, PortraitUploader
	store_in_background :image

	belongs_to :user
	has_many :posts
	has_many :hero_images
	has_many :videos

	validates :name, presence: true
	validates :synopsis, presence: true
	validates :image, presence: true
	validate :image_size_validation
		


	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end

	private
 
	def image_size_validation
		errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
	end

end
