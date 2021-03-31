class PrioritiesController < ApplicationController
  def remove_blog_post_priority
    @post = BlogPost.find(params[:blog_post_id])
    @post.blog_post_status = 'regular'
    authorize @post

    save_post
  end

  def remove_forum_post_priority
    @post = Thredded::Post.find(params[:forum_post_id])
    @post.forum_post_status = 'regular'
    authorize @post
    
    save_post
  end

  private

  def save_post
    if @post.save
      redirect_to root_path, alert: 'Removed priority succesfully'
    else
      render root_path, alert: 'Failed to remove priority'
    end
  end
end
