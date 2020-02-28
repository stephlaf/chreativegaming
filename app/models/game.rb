class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  has_one_attached :thumbnail

  monetize :price_cents
end
