class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one_attached :avatar
  has_many :likes, dependent: :destroy
  has_many :blog_posts
  has_many :blog_likes

  validates :gametag, presence: true
  validates :membership_level, inclusion: { in: ['', 'Bronze', 'Silver', 'Gold', 'Platinum'],
    message: "%{value} is not a valid level"}

  # instead of deleting, indicate the user requested a delete & timestamp it
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ensure user account is active
  def active_for_authentication?
    super && !deleted_at
  end

  # provide a custom message for a deleted account
  def inactive_message
    !deleted_at ? super : :deleted_account
  end
end
