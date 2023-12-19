class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :cover_image

  validates :name, presence: true
  validates :price, presence: true
  validates :cover_image, presence: true

end
