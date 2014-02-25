# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  post       :text
#  user_id    :integer
#  hero_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :post, :name, :hero_id

  belongs_to :user
  belongs_to :hero

  validates :post, presence: true
end
