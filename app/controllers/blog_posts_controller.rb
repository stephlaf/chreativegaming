class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = policy_scope(BlogPost)
  end

  def show
    authorize @blog_post
  end

  def new
    @blog_post = BlogPost.new
    authorize @blog_post
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.user = current_user
    authorize @blog_post

    if @blog_post.save
      redirect_to blog_post_path(@blog_post)
    else
      render :new
    end
  end

  def edit
    authorize @blog_post
  end

  def update
    if @blog_post.update(blog_post_params)
      authorize @blog_post
      redirect_to blog_post_path(@blog_post)
    else
      render :new
    end
  end

  def destroy
    authorize @blog_post
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :blog_image)
  end
end
