module Thredded
  class UserPreferencesFormPolicy
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def update?
      return true
    end
  end
end
