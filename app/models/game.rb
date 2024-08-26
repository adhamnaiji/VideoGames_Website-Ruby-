class Game < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, :description, :genre, :release_date, :price, presence: true
  validates :title, :description, :genre, :release_date, :price, :user_id, presence: true
end
