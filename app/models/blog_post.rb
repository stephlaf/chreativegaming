class BlogPost < ApplicationRecord
  belongs_to :user

  validates :title, :content, presence: true

  has_one_attached :blog_image

  scope :order_by_updated, -> { order(updated_at: :desc) }
end
