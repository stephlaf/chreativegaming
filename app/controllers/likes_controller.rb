require 'pry-byebug'
require 'json'

class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    # authorize
    unless already_liked?
      @like = @post.likes.create(user_id: current_user.id)
      authorize @like
    else
      @like = @post.likes.last
      authorize @like
      flash[:notice] = "You can't like more than once"
    end
    render json: { post: @post, count: @post.likes.count}
  end

  def destroy
    unless (already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    messageboard_topic_path(@post.postable)
  end

  private

  def find_post
    @post = Thredded::Post.find(params[:post_id])
  end

  def find_like
     @like = @post.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end
end
