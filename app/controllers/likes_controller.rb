class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    raise
    @post.likes.create(user_id: current_user.id)
    redirect_to messageboard_topic_path(@post.postable)
  end

  # def create
  #   if already_liked?
  #     flash[:notice] = "You can't like more than once"
  #   else
  #     @post.likes.create(user_id: current_user.id)
  #   end
  #   redirect_to post_path(@post)
  # end

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
