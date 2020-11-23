class BlogLikesController < ApplicationController
  before_action :set_blog_post

  def create_destroy
    unless already_liked?
      @blog_like = @blog_post.blog_likes.create(user_id: current_user.id)
      authorize @blog_like
      # raise
    else
      @blog_like_to_delete = find_blog_like
      @blog_like_to_delete.destroy
      # @blog_like = @blog_post.likes.last || BlogLike.new()
      authorize @blog_like
    end
    redirect_to blog_posts_path
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end

  def already_liked?
    BlogLike.where(user_id: current_user.id, blog_post_id:
    params[:blog_post_id]).exists?
  end

  def find_blog_like
     @blog_like = BlogLike.where(user_id: current_user.id, blog_post_id:
    params[:blog_post_id]).first
  end
end
