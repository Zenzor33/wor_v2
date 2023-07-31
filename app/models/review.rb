class Review < ApplicationRecord
  belongs_to :chair

  validates :name, :stars, :comment, presence: true
end
