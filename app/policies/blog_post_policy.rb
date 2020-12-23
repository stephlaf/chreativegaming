class BlogPostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # raise
      scope.all.includes(:user, :blog_image_attachment)
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
    return true if record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    if record.user == user || user.master
      return true
    end
  end
end
