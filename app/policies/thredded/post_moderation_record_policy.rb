module Thredded
  class PostModerationRecordPolicy
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def history?
      return @user.master
    end

    def users?
      return true
    end
  end
end
