class SeoTemplatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit_picture?
    user.master
  end

  def update_picture?
    user.master
  end
end
