class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

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

    # if blog_post_params[:published] && !current_user.master
    #   skip_authorization
    #   flash[:alert] = "You don't have the rights to publish!"
    #   render :new and return
    # end

    authorize @blog_post

    if @blog_post.save
      redirect_to blog_posts_path
    else
      render :new
    end
  end

  def edit
    authorize @blog_post
  end

  def update
    if blog_post_params[:published] && !current_user.master
      skip_authorization
      flash[:alert] = "You don't have the rights to publish!"
      render :new and return
    end

    if @blog_post.update(blog_post_params)
      authorize @blog_post
      redirect_to blog_posts_path
    else
      render :new
    end
  end

  def destroy
    authorize @blog_post
    @blog_post.destroy
    redirect_to blog_posts_path
  end

  def pre_liked?
    raise
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post)
      .permit(:title, :content, :blog_image, :published, :status)
      .tap do |p|
        case p[:status].downcase
        when 'regular'   then p[:status] = 0
        when 'priority'  then p[:status] = 1
        when 'published' then p[:status] = 2
        end
      end
  end

  def validate_blog_post
    if blog_post_params[:published] && !current_user.master
      skip_authorization
      render :new and return
    end
  end
end
