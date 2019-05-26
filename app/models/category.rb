class Category < ApplicationRecord
  has_many :topic
  mount_uploader :image, ImageUploader
end
