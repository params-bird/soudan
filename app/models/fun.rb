class Fun < ApplicationRecord
  belongs_to :follower,class_name:"User"
  # belongs_to :follower,class_name:"Campany"
  belongs_to :followed,class_name:"User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
