# == Schema Information
#
# Table name: heroes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  synopsis   :text
#  story      :text
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#  user_id    :integer
#  birthdate  :date
#  deathdate  :date
#

class Hero < ActiveRecord::Base
	attr_accessible :name, :first_name, :last_name, :city, :state, :synopsis, :story, :image, :birthdate, :deathdate
	mount_uploader :image, PortraitUploader
	#process_in_background :image

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
