class LikesController < ApplicationController
  before_action :find_post

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to messageboard_topic_path(@post.postable)
  end

  private

  def find_post
    @post = Thredded::Post.find(params[:post_id])
  end
end
