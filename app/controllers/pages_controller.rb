require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  POSTS_PER_PAGE = 10
  
  def home
    file = URI.open('https://res.cloudinary.com/chreative-gaming/image/upload/v1583507597/default_junymf.png')
    if current_user
      unless current_user.avatar.attached?
        current_user.avatar.attach(io: file, filename: 'defaul.png', content_type: 'image/png')
        current_user.save!
      end
    end
    @priority_posts = priorities
    @published_posts = published
    all_posts = regular_posts

    if (all_posts.count % POSTS_PER_PAGE).zero?
      @last_page = (all_posts.count / POSTS_PER_PAGE) - 1
    else
      @last_page = all_posts.count.fdiv(POSTS_PER_PAGE).floor
    end

    @page = params.fetch(:page, 0).to_i

    lower_limit = @page * POSTS_PER_PAGE
    upper_limit = (@page * POSTS_PER_PAGE) + (POSTS_PER_PAGE - 1)

    @regular_posts = all_posts[lower_limit..upper_limit]
    # raise
  end

  def about
  end

  def community
  end

  private

  def forum_post_priorities
    Thredded::Post.select(&:priority?).group_by(&:postable)
  end

  def priorities
    [forum_post_priorities.map { |_k, v| v.last || v },
      BlogPost.select(&:priority?)].flatten.sort_by(&:created_at).reverse
  end

  def published
    BlogPost.select(&:published?).sort_by(&:created_at).reverse
  end

  def regular_posts
    topics_to_remove = forum_post_priorities.keys
    all_topics = Thredded::Post.select(&:regular?).group_by(&:postable)
    filtered_topics = all_topics.reject { |topic, _posts| topics_to_remove.include?(topic) }

    [filtered_topics.map { |_topic, posts_aray_or_post| posts_aray_or_post.last || posts_aray_or_post },
      BlogPost.select(&:regular?)].flatten.sort_by(&:created_at).reverse
  end
end
