# frozen_string_literal: true

module Thredded
  class PostPolicy
    # The scope of readable posts.
    # MessageboardPolicy must be applied separately.
    class Scope
      # @param user [Thredded.user_class]
      # @param scope [ActiveRecord::Relation<Thredded::Post>]
      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      # @return [ActiveRecord::Relation<Thredded::Post>]
      def resolve
        @scope.moderation_state_visible_to_user(@user)
      end
    end

    # @param user [Thredded.user_class]
    # @param post [Thredded::Post]
    def initialize(user, post)
      @user = user
      @post = post
    end

    def create?
      @user.thredded_admin? ||
        !@post.postable.locked? &&
          # Users are allowed to post in unlocked topics of a locked messageboard
          # only if they would be allowed to post if the messageboard wasn't locked.
          @user.thredded_can_write_messageboards.include?(@post.messageboard)
    end

    def read?
      Thredded::TopicPolicy.new(@user, @post.postable).read? && @post.moderation_state_visible_to_user?(@user)
    end

    def update?
      # @user.thredded_admin? || own_post? || messageboard_policy.moderate?
      own_post?
    end

    def destroy?
      !@post.first_post_in_topic? && (update? || @user.thredded_admin?)
    end

    def moderate_post?
      return true
    end

    def anonymous?
      @user.thredded_anonymous?
    end

    delegate :moderate?, to: :messageboard_policy

    # Custom policies

    def remove_forum_post_priority?
      user_is_master?
    end

    private

    def messageboard_policy
      @messageboard_policy ||= Thredded::MessageboardPolicy.new(@user, @post.messageboard)
    end

    def own_post?
      !anonymous? && @user.id == @post.user_id
    end

    def user_is_master?
      @user.master
    end
  end
end


