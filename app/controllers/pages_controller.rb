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
    # raise
  end

  def about
  end

  def community
  end

  private

  def priorities
    [Thredded::Post.select(&:priority?),
      BlogPost.select(&:priority?)].flatten.sort_by(&:updated_at).reverse
  end

  def published
    [Thredded::Post.select(&:published?),
      BlogPost.select(&:published?)].flatten.sort_by(&:updated_at).reverse
  end

  def regular_posts
    [Thredded::Post.select(&:regular?),
      BlogPost.select(&:regular?)].flatten.sort_by(&:updated_at).reverse
  end

  def not_found
    # TODO Render alert & redirect
  end
end
