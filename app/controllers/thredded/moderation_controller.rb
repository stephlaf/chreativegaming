# frozen_string_literal: true

module Thredded
  class ModerationController < Thredded::ApplicationController
    before_action :thredded_require_login!
    before_action :thredded_require_moderator!

    def pending
      @posts = Thredded::PostsPageView.new(
        thredded_current_user,
        preload_posts_for_moderation(moderatable_posts.pending_moderation).order_oldest_first
          .send(Kaminari.config.page_method_name, current_page)
          .preload_first_topic_post
      )
      maybe_set_last_moderated_record_flash
      authorize @posts
    end

    def history
      @post_moderation_records = accessible_post_moderation_records
        .order(created_at: :desc)
        .send(Kaminari.config.page_method_name, current_page)
        .preload(:messageboard, :post_user, :moderator, post: :postable)
        .preload_first_topic_post
      authorize @post_moderation_records
    end

    def activity
      @posts = Thredded::PostsPageView.new(
        thredded_current_user,
        preload_posts_for_moderation(moderatable_posts).order_newest_first
          .send(Kaminari.config.page_method_name, current_page)
          .preload_first_topic_post
      )
      maybe_set_last_moderated_record_flash
      authorize @posts, :pending?
    end

    def moderate_post
      moderation_state = params[:moderation_state].to_s
      return head(:bad_request) unless Thredded::Post.moderation_states.include?(moderation_state)

      post = moderatable_posts.find(params[:id].to_s)
      topic_first_post = post.postable.first_post

      if post != topic_first_post && topic_first_post.moderation_state != 'approved'
        flash[:alert] = "You must first approve the topic 🤓"
      else
        if post.moderation_state != moderation_state
          flash[:last_moderated_record_id] = Thredded::ModeratePost.run!(
            post: post,
            moderation_state: moderation_state,
            moderator: thredded_current_user,
          ).id
        else
          flash[:alert] = "Post was already #{moderation_state}:"
          flash[:last_moderated_record_id] =
            Thredded::PostModerationRecord.order_newest_first.find_by(post_id: post.id)&.id
        end
      end

      authorize post
      redirect_back fallback_location: pending_moderation_path
    end

    def users
      @users = Thredded.user_class
        .eager_load(:thredded_user_detail)
        .merge(
          Thredded::UserDetail.order(
            Arel.sql('COALESCE(thredded_user_details.moderation_state, 0) ASC,'\
                     'thredded_user_details.moderation_state_changed_at DESC')
          )
        )
      @query = params[:q].to_s
      @users = DbTextSearch::CaseInsensitive.new(@users, Thredded.user_name_column).prefix(@query) if @query.present?
      @users = @users.send(Kaminari.config.page_method_name, current_page)
      authorize @users
    end

    def user
      @user = Thredded.user_class.find(params[:id])
      # Do not apply policy_scope here, as we want to show blocked posts as well.
      posts_scope = @user.thredded_posts
        .where(messageboard_id: policy_scope(Messageboard.all).pluck(:id))
        .order_newest_first
        .includes(:postable)
        .send(Kaminari.config.page_method_name, current_page)
      @posts = Thredded::PostsPageView.new(thredded_current_user, posts_scope)
      authorize @user
    end

    def moderate_user
      return head(:bad_request) unless Thredded::UserDetail.moderation_states.include?(params[:moderation_state])
      user = Thredded.user_class.find(params[:id])
      
      # Custom code to approve all pending posts when a new User is approved
      @pending_posts = user.thredded_posts.select { |post| post.moderation_state == 'pending_moderation' }
      approve_posts

      user.thredded_user_detail.update!(moderation_state: params[:moderation_state])
      redirect_back fallback_location: user_moderation_path(user.id)

      authorize user
    end

    private

    def maybe_set_last_moderated_record_flash
      return unless flash[:last_moderated_record_id]
      @last_moderated_record = accessible_post_moderation_records.find(flash[:last_moderated_record_id].to_s)
    end

    def moderatable_posts
      if moderatable_messageboards == Thredded::Messageboard.all
        Thredded::Post.all
      else
        Thredded::Post.where(messageboard_id: moderatable_messageboards)
      end
    end

    def accessible_post_moderation_records
      if moderatable_messageboards == Thredded::Messageboard.all
        Thredded::PostModerationRecord.all
      else
        Thredded::PostModerationRecord.where(messageboard_id: moderatable_messageboards)
      end
    end

    def moderatable_messageboards
      @moderatable_messageboards ||= thredded_current_user.thredded_can_moderate_messageboards
    end

    def current_page
      (params[:page] || 1).to_i
    end

    def preload_posts_for_moderation(posts)
      posts.includes(:user, :messageboard, :postable)
    end

    def approve_posts
      @pending_posts.each do |post|
        post.moderation_state = 'approved'
        post.save!
      end
    end
  end
end
