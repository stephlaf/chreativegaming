class SeoTemplate < ApplicationRecord
  has_one_attached :home_page_picture

  validates :home_page_picture, presence: true
end
