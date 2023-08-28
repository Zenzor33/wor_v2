class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :liked_chairs, through: :favorites, source: :chair
  has_many :chairs, dependent: :destroy


  has_secure_password

  validates :name, presence: true
  validates :email, 
    presence: true,
    format: { with: /\S+@\S+/ },
    uniqueness: {case_sensitive: false}
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
