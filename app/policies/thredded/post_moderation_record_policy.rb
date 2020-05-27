module Thredded
  class PostModerationRecordPolicy
    def initialize(user, scope)
      raise
      @user = user
      @scope = scope
    end

    def history?
      raise
    end
  end
end
