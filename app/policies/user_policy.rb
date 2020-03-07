class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  # def new?
  #   # raise
  #   return true if @user.master == true
  # end

  # def create?
  #   return true if @user.master == true
  # end

  def edit?
    return true
  end

  def update?
    return true
  end

  def destroy?
    return true
    # return true if @user.master == true
  end

  # def toggle_availability?
  #   return true if @user.master == true
  # end

  def archive_profile?
    return true
  end
end
