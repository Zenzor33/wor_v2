class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :liked_chairs, through: :favorites, source: :chair
  has_many :chairs, dependent: :destroy

  has_one_attached :avatar


  has_secure_password

  validate :acceptable_image
  validates :name, presence: true
  validates :email, 
    presence: true,
    format: { with: /\S+@\S+/ },
    uniqueness: {case_sensitive: false}
  validates :password, presence: true
  validates :password_confirmation, presence: true

  private

  def acceptable_image
    return unless avatar.attached?

    unless avatar.blob.byte_size <= 1.megabyte
      errors.add(:avatar, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/jpg", "image/png"]
    unless acceptable_types.include?(avatar.blob.content_type)
      errors.add(:avatar, "must be a JPG, JPEG or PNG")
    end
  end 
end
