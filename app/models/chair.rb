class Chair < ApplicationRecord

  has_many :reviews

  validates :name, :available_from, presence: true

  def self.available
    where("available_from < ?", Time.now).order("available_from")
  end
end
