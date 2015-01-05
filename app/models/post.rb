# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  post       :text
#  user_id    :integer
#  ember_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :post, :name, :ember_id

  belongs_to :user
  belongs_to :ember

  validates :post, presence: true

end
