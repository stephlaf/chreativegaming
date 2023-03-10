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

  # Method called from thredded::moderation_controller#users
  def users?
    return true
  end

  # Method called from thredded::moderation_controller#user
  def user?
    return true
  end

  # Method called from thredded::moderation_controller#moderate_user
  def moderate_user?
    return true
  end

  def archive_profile?
    return true
  end

  def master?
    user.master
  end
end
