class BlogPost < ApplicationRecord
  belongs_to :user
  has_many :blog_likes, dependent: :destroy

  enum status: { regular: 0, priority: 1, published: 2 }

  validates :title, :content, presence: true
  validates :status, inclusion: { in: :status }

  has_one_attached :blog_image

  scope :order_by_updated, -> { order(updated_at: :desc) }
end
