class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :categories, dependent: :destroy

  # validates_inclusion_of :blocked, in: [true, false]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {customer: 0, seller: 1, admin: 3}


  attribute :blocked, default: false



  def self.ransackable_associations(auth_object = nil)
    ["bookings", "categories", "products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "id_value", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at", "blocked"]
  end

end
