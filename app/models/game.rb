class Game < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, :description, :genre, :release_date, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
