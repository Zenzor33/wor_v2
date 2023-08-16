class Chair < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likers, through: :favorites, source: :user


  validates :name, :available_from, presence: true

  def self.available
    where("available_from < ?", Time.now).order("available_from")
  end

  def average_rating
    reviews.average(:stars).round.to_i
  end
end
