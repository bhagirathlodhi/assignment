class Category < ApplicationRecord
  has_one_attached :cat_image
  has_many :products , dependent: :destroy

end
