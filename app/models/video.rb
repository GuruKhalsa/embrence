# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  file       :string(255)
#  user_id    :integer
#  hero_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  file_tmp   :string(255)
#

class Video < ActiveRecord::Base
	#after_commit :resize_thumb

  attr_accessible :title, :file, :hero_id
  belongs_to :hero
  belongs_to :user

  mount_uploader :file, VideoUploader
  store_in_background :file

  validates :file, presence: true
  validate :file_size_validation

  def resize_thumb
    storage = Fog::Storage.new({
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJGNK4H2X2NGCDI6Q',
    :aws_secret_access_key  => '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'
    })

    directory = connection.directories.get("all-my-data")
  	thumb = MiniMagick::Image.read("public/" + self.file.url(:thumb)).first
	thumb.resize_to_fill!(105, 59)
	thumb.write "public/#{self.file.url(:thumb)}"
  end

  def set_success(format, opts)
  	self.success = true
  end

  private
 
  def file_size_validation
    errors[:file] << "should be less than 50MB" if file.size > 50.megabytes
  end
end
