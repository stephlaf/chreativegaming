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
  has_many :orders

  enum gamer_type: { gamer: 0, game_developer: 1, game_enthusiast: 2, all_of_the_above: 3, none_of_the_above: 4 }

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

  def paid_orders
    orders.where(state: 'paid')
  end

  def bought_games
    paid_orders.map(&:game)
  end

  def game_bought?(game)
    bought_games.include?(game)
  end

  def pending_orders(game)
    Order.where(user: self, game: game, state: 'pending')
  end
end
