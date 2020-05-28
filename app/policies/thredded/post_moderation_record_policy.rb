module Thredded
  class PostModerationRecordPolicy
    def initialize(user, scope)
      # raise
      @user = user
      @scope = scope
    end

    def history?
      # raise
      return true
    end
  end
end
