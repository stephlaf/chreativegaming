class BlogPost < ApplicationRecord
  belongs_to :user
  has_many :blog_likes, dependent: :destroy

  has_rich_text :content

  enum blog_post_status: { regular: 'regular', priority: 'priority', published: 'published' }

  validates :title, :content, presence: true
  validates :blog_post_status, inclusion: { in: :blog_post_status }
  validate :media_size, if: -> { blog_image.attached? }

  has_one_attached :blog_image

  scope :order_by_updated, -> { order(updated_at: :desc) }
  scope :order_by_created, -> { order(created_at: :desc) }

  def published?
    blog_post_status == 'published'
  end

  def media_size
    if blog_image.blob.byte_size > 10.megabytes
      errors.add(:blog_image, 'size exceeds the allowed limit (10 MB)')
    end
  end
end
