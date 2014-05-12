class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :microposts
  belongs_to :user
  validates :content, :presence => true  
end
