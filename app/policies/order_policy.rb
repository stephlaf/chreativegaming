class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def create?
    record.valid?
  end

  def rollback_canceled_order?
    true
  end

  def rollback_aborted_transaction?
    true
  end
end
