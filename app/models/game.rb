class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  has_one_attached :thumbnail
  has_one_attached :banner
  has_one_attached :game_file

  monetize :price_cents
end
