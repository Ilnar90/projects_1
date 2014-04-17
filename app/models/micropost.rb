class Micropost < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :user
  validates :title, presence: true, length: { maximum: 70 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
end
