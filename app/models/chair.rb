class Chair < ApplicationRecord

  before_save :set_slug
  before_validation :set_slug, on: [:create]


  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likers, through: :favorites, source: :user
  has_many :feature_assignments, dependent: :destroy
  has_many :features, through: :feature_assignments
  belongs_to :user


  validates :name, :available_from, :user, presence: true
  validates :slug, presence: true, uniqueness: true

  scope :available, -> { where("available_from < ?", Time.now).order("available_from") }
  # TODO: change Time.now to Time.current
  scope :low_price_chair, -> { where("price < ?", 500).order("price") }

  def average_rating
    return nil if reviews.none?
    
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
