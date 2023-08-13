class Review < ApplicationRecord
  belongs_to :chair
  belongs_to :user

  validates :stars, :comment, presence: true


end
