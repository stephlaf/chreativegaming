require 'json'

class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create_destroy
    unless already_liked?
      @like = @post.likes.create(user_id: current_user.id)
      authorize @like
      render json: {
        post: @post,
        count: @post.likes.count,
        linkText: "Unlike this post"
      }
    else
      @like_to_delete = find_like
      @like_to_delete.destroy

      @like = @post.likes.last || Like.new()
      authorize @like
      
      render json: {
        post: @post,
        count: @post.likes.count,
        linkText: "Like this post"
      }
    end
  end

  private

  def find_post
    @post = Thredded::Post.find(params[:post_id])
  end

  def find_like
     @like = Like.where(user_id: current_user.id, post_id:
    params[:post_id]).first
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end
end
