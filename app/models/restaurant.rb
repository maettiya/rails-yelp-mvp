class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  Restaurant::CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: Restaurant::CATEGORY }

  def average_rating
    return 0 if reviews.empty?
    reviews.average(:rating).round(1)
  end
end
