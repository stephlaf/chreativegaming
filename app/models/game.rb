class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  has_one_attached :thumbnail
  has_one_attached :banner
  has_one_attached :game_file

  validates :name, presence: true
  validates :download_link, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 180 }

  validates :thumbnail, presence: true

  # Commented out temporarily until banner is actually in use
  # validates :banner, presence: true

  monetize :price_cents
  monetize :price_bronze_cents
  monetize :price_silver_cents
  monetize :price_gold_cents
  monetize :price_platinum_cents
end
