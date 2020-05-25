module Thredded
  class PostsPageViewPolicy
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def pending?
      @user.master
    end
  end
end
