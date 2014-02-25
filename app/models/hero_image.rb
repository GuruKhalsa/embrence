# == Schema Information
#
# Table name: hero_images
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  hero_id    :integer
#  user_id    :integer
#

class HeroImage < ActiveRecord::Base
  attr_accessible :title, :image, :hero_id
  mount_uploader :image, HeroUploader
  #process_in_background :image

  belongs_to :hero
  belongs_to :user

  validates :image, presence: true
  validate :image_size_validation

	private
 
	def image_size_validation
		errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
	end
end
