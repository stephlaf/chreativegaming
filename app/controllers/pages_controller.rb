require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  
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
    @regular_posts = regular_posts
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
