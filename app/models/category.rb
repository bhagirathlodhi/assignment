class Category < ApplicationRecord
  has_one_attached :cat_image
  has_many :products , dependent: :destroy
  belongs_to :user

  validates :cat_image, presence: true
  validates :name, presence: true

end
