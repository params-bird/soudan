class Image < ApplicationRecord
  belongs_to :product
  mount_uploader :image_path, ImageUploader
end
