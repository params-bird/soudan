class Image < ApplicationRecord
  belongs_to :post, optional: true, inverse_of: :images

end
