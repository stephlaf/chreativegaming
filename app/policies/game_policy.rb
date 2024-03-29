class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.includes(:thumbnail_attachment)
    end
  end

  def show?
    return true
  end

  def new?
    # raise
    return true if @user.master == true
  end

  def create?
    return true if @user.master == true
  end

  def edit?
    return true if @user.master == true
  end

  def update?
    return true if @user.master == true
  end

  def destroy?
    return true if @user.master == true
  end

  def toggle_availability?
    return true if @user.master == true
  end

  def my_games?
    true
  end
end
