class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :post_images
end
