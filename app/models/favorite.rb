class Favorite < ApplicationRecord
  belongs_to :chair
  belongs_to :user
end
