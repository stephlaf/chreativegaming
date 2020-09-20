class BlogPostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    if record.user == user || user.master
      return true
    end
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
