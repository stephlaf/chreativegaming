class Order < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :user, uniqueness: { scope: :game }, if: :paid?

  monetize :amount_cents

  private

  def paid?
    self.state == 'paid'
  end
end
