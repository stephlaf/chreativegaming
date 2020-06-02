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
  end

  def about
  end

  def community
  end

  def priorities
    Thredded::Post.select { |post| post.priority_post }
  end

  def not_found
    # TODO Render alert & redirect
  end
end
