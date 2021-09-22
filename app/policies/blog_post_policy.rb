class BlogPostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.includes(:user, :blog_image_attachment)
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    record.user == user || user.master
  end

  def remove_blog_post_priority?
    user.master
  end
end
