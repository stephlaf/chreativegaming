require 'json'

class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :orders
  has_one_attached :thumbnail
  has_one_attached :banner
  has_one_attached :game_file
  has_many_attached :carousel_visuals

  validates :name, presence: true
  validates :download_link, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 180 }
  validates :thumbnail, presence: true
  validate :carousel_visuals_count, if: -> { carousel_visuals.attached? }

  # Commented out temporarily until banner is actually in use
  # validates :banner, presence: true

  monetize :price_cents
  monetize :price_bronze_cents
  monetize :price_silver_cents
  monetize :price_gold_cents
  monetize :price_platinum_cents

  # Collection for available_platforms
  PLATFORMS = ['PC', 'MAC', 'Android', 'iOS']

  def platforms_to_a
     self.available_platforms = self.available_platforms.nil? ? [] : JSON.parse(self.available_platforms)
  end

  private

  def carousel_visuals_count
    unless carousel_visuals.size == 4
      errors.add(:carousel_visuals, "must have 4 visuals attached")
    end
  end
end
