# == Schema Information
#
# Table name: hero_images
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  image      :string(255)
#  user_id    :integer
#  ember_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  image_tmp  :string(255)
#

class HeroImage < ActiveRecord::Base
  attr_accessible :title, :image, :ember_id
  mount_uploader :image, HeroUploader
  store_in_background :image

  belongs_to :ember
  belongs_to :user

  validates :image, presence: true
  validate :image_size_validation

	private
 
	def image_size_validation
		errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
	end
end
