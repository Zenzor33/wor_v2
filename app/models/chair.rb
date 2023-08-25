class Chair < ApplicationRecord

  before_save :set_slug
  before_validation :set_slug, on: [:create]


  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likers, through: :favorites, source: :user
  has_many :feature_assignments, dependent: :destroy
  has_many :features, through: :feature_assignments


  validates :name, :available_from, presence: true
  validates :slug, presence: true, uniqueness: true

  scope :available, -> { where("available_from < ?", Time.now).order("available_from") }
  scope :low_price_chair, -> { where("price < ?", 500).order("price") }

  def average_rating
    reviews.average(:stars).round.to_i
  end

  def to_param 
    slug
  end 

  private 

  def set_slug
    self.slug = name.parameterize
  end 
end
