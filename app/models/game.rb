class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  has_one_attached :thumbnail
  has_one_attached :banner
  has_one_attached :game_file

  monetize :price_cents
  monetize :price_bronze_cents
  monetize :price_silver_cents
  monetize :price_gold_cents
  monetize :price_platinum_cents
end
