class BlogPost < ApplicationRecord
  belongs_to :user
  has_many :blog_likes, dependent: :destroy

  validates :title, :content, presence: true

  has_one_attached :blog_image

  scope :order_by_updated, -> { order(updated_at: :desc) }
end
