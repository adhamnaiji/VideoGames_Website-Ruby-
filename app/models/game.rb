class Game < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image
end
