class BlogPost < ApplicationRecord
  belongs_to :user
  has_many :blog_likes, dependent: :destroy

  enum blog_post_status: { regular: 'regular', priority: 'priority', published: 'published' }

  validates :title, :content, presence: true
  validates :blog_post_status, inclusion: { in: :blog_post_status }

  validates :content, length: { maximum: 1500 }

  has_one_attached :blog_image

  scope :order_by_updated, -> { order(updated_at: :desc) }
end
