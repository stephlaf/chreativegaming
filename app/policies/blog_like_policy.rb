class BlogLikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create_destroy?
    return true
  end
end
